<?php

class ProductEntity extends Base{

  protected $table = 'product_entities';

  public function product(){
    return $this->belongsTo('Product','product_id');
  }
}