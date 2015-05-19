<?php

class Comment extends Base{

  protected $table = 'product_comments';


    public function product(){
        return $this->hasOne('Product','id','product_id');
    }

    public function user(){
        return $this->belongsTo('Customer','customer_id');
    }

    public function entity(){
        return $this->belongsTo('ProductEntity','product_entity_id');
    }

}