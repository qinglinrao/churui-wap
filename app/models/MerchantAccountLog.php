<?php

class MerchantAccountLog extends Base{

  protected $table = 'merchant_account_logs';

  public function upCoverImage(){
      return $this->belongsTo('Image','identity_up_image_id','id');
  }

  public function downCoverImage(){
      return $this->belongsTo('Image','identity_down_image_id','id');
  }

  public function scopeOfType($query,$type=1){
      return $query->where('operate_type',$type);

  }






}