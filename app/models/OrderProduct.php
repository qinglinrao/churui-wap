<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-1-4
 * Time: 下午2:00
 */

class OrderProduct  extends Base{

    protected $table = 'customer_order_products';

    public function product(){
        return $this->belongsTo('Product','product_id','id');
    }

    public function scopeShop($query,$merchant){
        if(!$merchant){
            $merchant = Auth::merchant()->user();
        }
        return $query->where('shop_id',$merchant->ownShop->id);
    }

    public function ownShop(){
        return $this->belongsTo('Shop','shop_id','id');
    }



} 