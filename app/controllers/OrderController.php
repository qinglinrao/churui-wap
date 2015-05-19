<?php

class OrderController extends BaseController {

    //客户订单列表
    public function getIndex(){

        if(Input::has('status') && Input::get('status') != ''){
            $status = Input::get('status');
            $orders = Order::customer()
                            ->statusIn(get_order_status_group($status))
                            ->orderBy('updated_at','desc')
                            ->with('products.product.image')->get();
        }else{
            $status = '';
            $orders = Order::customer()
                            ->orderBy('updated_at','desc')
                            ->with('products.product.image')->get();
        }
        return View::make('customers.orders.index')
                     ->with('orders',$orders)
                     ->with('status',$status);
    }

    //订单详情
    public function getDetail($order_id){
        $order = Order::with('address','products')->customer()->find($order_id);

        if(!$order){
            App::abort(404);
        }

        $returnResult = false;
        if($order->status_id != 2 && Input::has('request_token')){

            $config = $this->getPayConfig($order);

            $wap = Alipay::instance('wap');

            $returnResult = $wap->setConfig($config)->verifyReturn();
        }

        return View::make('customers.orders.detail',compact('order','returnResult'));

    }


    //订单评论页
    public function getComment($order_id){
        $order = Order::customer()
            ->where('status_id',4)
            ->where('id',$order_id)
            ->with('products.product.image','address')->first();
        return View::make('customers.comments.new')->with('order',$order);
    }

    //订单评论操作
    public function postComment($order_id){
        $order = Order::where('id',$order_id)->customer()->first();
        if($order){
            if($order->status_id != 4){
                return Redirect::route('orders.comment',array('id'=>$order_id))->withErrors(array('order.not_exist'=>'此订单不能评价或已评价过'))->withInput();
            }else{
                $comments = Input::get('comment');
                $customer_id = Auth::customer()->user()->id;
                foreach($comments as $key=>$comment){
                    $product_comment = new Comment();
                    $product_comment->product_id = strToInt($comment['product_id']);
                    $product_comment->product_entity_id = strToInt($key);
                    $product_comment->author = Auth::merchant()->user()->username;
                    $product_comment->customer_id = $customer_id;
                    $product_comment->detail = $comment['detail'];
                    $product_comment->star = $comment['star'];
                    $product_comment->save();
                }
                $order->status_id = 5;
                $order->save();
                $this->addOrderHistory($order,5);

                return Redirect::route('comments');
            }

        }else{
            return Redirect::route('orders')->withErrors(array('order.not_exist'=>'订单不存在'));
        }

    }

    //修改订单状态操作
    public function getChangeStatus($order_id,$status)
    {
        $order = Order::where('id', $order_id)->customer()->first();
        if ($order) {
            if (confirm_order_action($order->status_id, $status)) {
                $order->status_id = $status;
                $order->save();
                $this->addOrderHistory($order,$status);
                return Redirect::route('orders');
            } else {
                return Redirect::route('orders')->withErrors(array('order.not_exist' => '该行为未在规定中.'));
            }

        } else {
            return Redirect::route('orders')->withErrors(array('order.not_exist' => '订单不存在'));
        }
    }

    //创建订单操作
    public function postCreate(){
        $type = Input::get('type');

        if($type === 'buy_from_cart'){
            if(ShoppingCart::customer()->count() == 0){
                App::abort(500);
            }
        }

        $entityIds = Input::get('entityIds');

        $entities = ProductEntity::with('product')->whereIn('id',explode(',',$entityIds))->get();

        $order = new Order();
        $order->order_sn = Order::createOrderSn();
        $order->order_title = $entities[0]->product->name;
        $order->total = Order::getTotalPrice($type,$entities);
        $order->count = Order::getTotalCount($type,$entities);
        $order->note = Input::get('message');
        $order->status_id = 1; //待支付
        $order->status_name = '待支付';
        $order->payment_method = Input::get('payment');
        $order->customer_id = Auth::customer()->user()->id;

        if($order->save()){
            Session::forget('buyDirectData');//删除直接购买的商品SESSION

            $this->bindOrderProducts($type,$order,$entities);
            $this->bindOrderAddress($order);
            $this->addOrderHistory($order,1);

            return Redirect::route('orders.detail',$order->id);
        }else{
            App::abort(500);
        }

    }


    //绑定订单产品
    private function bindOrderProducts($type,$order,$entities){
        if($type === 'buy_direct'){ //直接购买

            $entity = $entities[0];

            $orderProduct = $this->getOrderProduct($order,$entity,Input::get('quantity'),Input::get('shopId'));

            DB::table('customer_order_products')->insert($orderProduct);


        }elseif($type === 'buy_from_cart'){ //从购物车结算
            $cartItems = ShoppingCart::customer()->with('entity.product')->get();
            $orderProducts = [];
            foreach($cartItems as $item){
                $entity = $item->entity;
                $orderProducts[] = $this->getOrderProduct($order,$entity,$item->quantity,$item->shop_id);
            }

            DB::table('customer_order_products')->insert($orderProducts);

            //cleanup shopping cart
            ShoppingCart::customer()->delete();
        }
    }

    //绑定订单地址
    private function bindOrderAddress($order){
        $orderAddress = new OrderAddress;
        $address = Address::find(Input::get('address'));

        $orderAddress->name = $address->name;
        $orderAddress->address = $address->address;
        $orderAddress->alias = $address->alias;
        $orderAddress->mobile = $address->mobile;
        $orderAddress->telephone = $address->telephone;
        $orderAddress->region_id = $address->region_id;
        $orderAddress->order_id = $order->id;

        $orderAddress->save();

    }

    //获取(设置)订单产品信息
    private function getOrderProduct($order,$entity,$quantity,$shop_id){

        $orderProduct = [
            'name' => $entity->product->name,
            'product_id' => $entity->product_id,
            'price' => $entity->sale_price,
            'total' => $entity->sale_price * $quantity,
            'sku' => $entity->sku,
            'quantity' => $quantity,
            'option_set' => $entity->option_set,
            'option_set_values' => $entity->option_set_values,
            'product_entity_id' => $entity->id,
            'order_id' => $order->id,
            'image_url'=> $entity->product->image->url,
            'shop_id' => $shop_id
        ];

        //update product sale_count
        DB::table('products')->where('id',$entity->product_id)->increment('sale_count', $quantity);

        return $orderProduct;
    }

    //添加订单历史记录
    public function addOrderHistory($order,$status_id){
        $orderHistory = new OrderHistory();
        $orderHistory->comment = get_status_name()[$status_id];
        $orderHistory->order_id = $order->id;
        $orderHistory->status_id = $status_id;
        $orderHistory->status_name = get_status_name()[$status_id];
        if($orderHistory->save()) return true;
        else return false;

    }



}
