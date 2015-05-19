<?php

class Base extends Eloquent {


  public function scopeCustomer($query,$customer_id = false){
    if(!$customer_id){
      $customer_id = Auth::customer()->user()->id; //todo get Auth::user()->id;
    }
    return $query->where('customer_id',$customer_id);
  }

  public function scopeMerchant($query,$merchant_id = false){
        if(!$merchant_id){
            $merchant_id = Auth::merchant()->user()->id; //todo get Auth::user()->id;
        }
        return $query->where('merchant_id',$merchant_id);
    }

  public function image(){
    return $this->belongsTo('Image','image_id');
  }

  public function scopeLatest($query){
    return $query->orderBy('updated_at','desc')->orderBy('created_at','desc');
  }
}