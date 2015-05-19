<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class Merchant extends Eloquent implements UserInterface, RemindableInterface {

    use UserTrait, RemindableTrait;

    protected $table = 'merchants';

    public function image(){
        return $this->belongsTo('Image');
    }

    public function account(){
        return $this->hasOne('MerchantAccount','merchant_id','id');
    }

    public function ownShop(){
        return $this->hasOne('Shop','merchant_id','id');
    }

    public function customers(){
        return $this->hasMany('Customer');
    }

    public function followers(){
        return $this->hasMany('Merchant','leader_id','id');
    }

    public function scopeVisible($query){
        return $query->where('visible',1);
    }

    public function leader(){
        return $this->belongsTo('Merchant','leader_id','id');
    }

}