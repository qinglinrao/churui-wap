<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-1-4
 * Time: 下午2:00
 */

class Order  extends Base{

    protected $table = 'customer_orders';

    /**
     * 生成order sn
     */
    public static function createOrderSn(){

        $time = Carbon::now()->format('ymd');

        $orderSnId = OrderSnId::create([])->id;

        return $time.$orderSnId;
    }

    /**
     * @param object $entities 购买的商品实例
     * @return string $totalPrice 订单总额
     */
    public static function getTotalPrice($type,$entities){
        $totalPrice = 0;
        if($type === 'buy_direct'){ //直接购买
            $price = $entities[0]->sale_price;
            $totalPrice = $price * Input::get('quantity');

        }elseif($type === 'buy_from_cart'){ //从购物车结算
            $cartItems = ShoppingCart::customer()->with('entity')->get();
            foreach($cartItems as $item){
                $totalPrice += $item->quantity * $item->entity->sale_price;
            }
        }
        return $totalPrice;
    }

    /**
     * @param object $entities 购买的商品实例
     * @return string $totalPrice 订单总额
     */
    public static function getTotalCount($type,$entities){
        $totalCount = 0;
        if($type === 'buy_direct'){ //直接购买
            $totalCount = Input::get('quantity');

        }elseif($type === 'buy_from_cart'){ //从购物车结算
            $cartItems = ShoppingCart::customer()->with('entity')->get();
            foreach($cartItems as $item){
                $totalCount += $item->quantity;
            }
        }
        return $totalCount;
    }


    public function products() {

        return $this->hasMany('OrderProduct', 'order_id');
    }

    public function address(){
        return $this->hasOne('OrderAddress');
    }

    public function scopeStatusIn($query,$status_id = array()){
        return $query->whereIn('status_id',$status_id);
    }

    public function scopeOrderSn($query,$orderSn){
        return $query->where('order_sn',$orderSn);
    }

    public function buyer(){
        return $this->belongsTo('Customer','customer_id','id');
    }

    public function realProducts(){
        return $this->belongsToMany('Product','customer_order_products','order_id','product_id');
    }

    public function ownShop(){
        return $this->belongsTo('Shop','shop_id','id');
    }

    public function adviser(){
        return $this->belongsTo('Adviser','adviser_id','id');
    }

    public function logistics(){
        return $this->belongsTo('LogisticsCompany','logistics_company_id','id');
    }

    public function scopeWaitingPay($query){
        return $query->where('status_id',1);
    }





} 