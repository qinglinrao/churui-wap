<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-1-4
 * Time: 下午2:00
 */

class Shop  extends Base{

    protected $table = 'shops';

    public function logoImage(){
        return $this->belongsTo('Image','logo_image_id','id');
    }

    public function coverImage(){
        return $this->belongsTo('Image','cover_image_id','id');
    }

    public function products(){
        return $this->belongsToMany('Product', 'shop_products', 'shop_id', 'product_id');
//        return $this->hasMany('ShopProduct');
    }

    public function shopProducts(){
        return $this->hasMany('ShopProduct','shop_id','id');
    }

    public function owner(){
        return $this->belongsTo('Merchant','merchant_id','id');
    }








} 