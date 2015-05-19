<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class Customer extends Base implements UserInterface, RemindableInterface {

	use UserTrait, RemindableTrait;

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'customers';

	/**
	 * The attributes excluded from the model's JSON form.
	 *
	 * @var array
	 */
	protected $hidden = array('password', 'remember_token');

    public function detail() {

        return $this->hasOne('CustomerDetail');
        //return $this->belongsTo('CustomerDetail','customer_id')->remember(5);
    }

    public function leader(){
        return $this->belongsTo('Merchant','merchant_id','id');
    }



}
