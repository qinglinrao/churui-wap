<?php

class MerchantAccount extends Base{

  protected $table = 'merchant_accounts';

    public function upImage(){
        return $this->belongsTo('Image','identity_up_image_id','id');
    }

    public function downImage(){
        return $this->belongsTo('Image','identity_down_image_id','id');
    }



}