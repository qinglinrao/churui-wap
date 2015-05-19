<?php

class ShoppingController extends BaseController {

    //购物车产品列表
    public function getCart(){

        $cartItems = ShoppingCart::customer()->with('product.image','entity')->get();

        $totalPrice = 0;

        foreach($cartItems as $item){
            $totalPrice += $item->quantity * $item->entity->sale_price;
        }

        return View::make('customers.shopping.cart',compact('cartItems','totalPrice'));
    }

    //购物车产品数量统计
    public function getCartCount(){
        if(Auth::customer()->check()){
            $cartItems = ShoppingCart::customer()->count();
        }else{
            $cartItems = 0;
        }

        return Response::json($cartItems);
    }

    //添加产品到购物车
    public function postCartAdd(){

        $data = [
            'product_entity_id'=>Input::get('entityId'),
            'product_id'=>Input::get('productId'),
            'customer_id'=>Auth::customer()->user()->id,
            'shop_id' => Input::get('shopId')
        ];

        $entity = ShoppingCart::firstOrNew($data);

        $entity->customer_id = Auth::customer()->user()->id;
        $entity->product_entity_id = Input::get('entityId');
        $entity->product_id = Input::get('productId');
        $entity->quantity += Input::get('buyCount');
        $entity->shop_id = Input::get('shopId');

        if($entity->save()){
            $result['state'] = 1;
            $result['cartItems'] = ShoppingCart::customer()->count();
            $result['msg'] = '商品已成功添加进购物车';
        }else{
            $result['state'] = 0;
        }

        return Response::json($result);
    }

    //将产品从购物车删除
    public function postCartDelete(){
        $id = Input::get('itemId');
        if(ShoppingCart::destroy($id)){
            $result['state'] = 1;
            $result['msg'] = '商品已删除';
        }else{
            $result['state'] = 0;
            $result['msg'] = '系统出错';
        }
        return Response::json($result);
    }

    //更新购物车产品数量
    public function postCartUpdate(){
        $id = Input::get('itemId');
        $count = Input::get('count');
        $item = ShoppingCart::find($id);
        $item->quantity = $count;

        if($item->save()){
            $result['state'] = 1;
        }else{
            $result['state'] = 0;
            $result['msg'] = '数量更改失败';
        };

        return Response::json($result);
    }

    //订单结算check
    public function getCheckout(){
        $addresses = Address::customer()->get();

        if($addresses->count() == 0){
            return Redirect::route('address.add',['redirect'=>'checkout']);
        }


        $items = ShoppingCart::customer()->with('entity')->get();

        if($items->count() == 0){
            return Redirect::route('cart');
        }

        $totalPrice = 0;
        foreach($items as $item){
            $totalPrice += $item->quantity * $item->entity->sale_price;
        }

        $defaultAddress = Address::customer()->orderBy('default','desc')->first();

        $entityIds = implode(',',$items->lists('product_entity_id'));
        $type = 'buy_from_cart';
        $quantity = 0;
        $shopId = $item->shop_id;

        return View::make('customers.shopping.checkout',compact('totalPrice','addresses','defaultAddress',
            'entityIds','type','quantity','shopId'));
    }

    //直接购买check
    public function anyCheckoutDirect(){

        $data = Input::all();

        $addresses = Address::customer()->get();

        if(Request::isMethod('post')){
            Session::put('buyDirectData',$data);
        }

        if($addresses->count() == 0){
            return Redirect::route('address.add',['redirect'=>'checkout.direct']);
        }

        if(Request::isMethod('get')){
            if(is_array(Session::get('buyDirectData'))){
                $data = Session::get('buyDirectData');
            }else{
                return Redirect::route('cart');
            }
        }

        $item = new ShoppingCart();
        $item->quantity = $data['num'];
        $item->product_entity_id = $data['entityId'];
        $item->product_id = $data['productId'];
        $item->shop_id = Input::get('shopId');
        $shopId = $item->shop_id;
        $totalPrice = $item->quantity * $item->entity->sale_price;

        $defaultAddress = Address::customer()->orderBy('default','desc')->first();

        $entityIds = $item->product_entity_id;

        $type = 'buy_direct';
        $quantity = $data['num'];

        return View::make('customers.shopping.checkout',compact('item','totalPrice','addresses','defaultAddress',
            'entityIds','type','quantity','shopId'));
    }

}
