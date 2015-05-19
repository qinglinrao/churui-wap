<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-1-4
 * Time: 下午2:00
 */

class ShopProduct  extends Base{

    protected $table = 'shop_products';

    public function product(){
        return $this->belongsTo('Product');
    }

    public function scopeShop($query){
        return $query->where('shop_id',Auth::merchant()->user()->ownShop->id);
    }









} 