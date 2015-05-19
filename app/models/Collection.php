<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-1-4
 * Time: 下午2:00
 */

class Collection  extends Base{

    protected $table = 'customer_collections';


    public function scopeProductId($query,$pid){
        return $query->where('product_id',$pid);
    }

    public function product(){
        return $this->belongsTo('Product','product_id','id');
    }
} 