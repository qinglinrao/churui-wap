<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-1-4
 * Time: 下午2:00
 */

class ShoppingCart  extends Base{

    protected $table = 'customer_shopping_carts';

    protected $fillable = ['*'];

    public function product(){
        return $this->belongsTo('Product','product_id');
    }

    public function entity(){
        return $this->belongsTo('ProductEntity','product_entity_id');
    }
} 