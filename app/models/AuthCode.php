<?php

class AuthCode extends Base{

	protected $table = 'auth_codes';

	public function scopeValid($query){
		return $query->where('state','=','0')->where('created_at', '>=', Carbon::now()->subMinutes(Config::get('app.verify_phone_time')));
	}

	public function scopeCode($query,$code){
		return $query->where('code',$code);
	}

	public function scopeType($query,$type){
		return $query->where('type',$type);
	}

	public function scopeEmail($query,$email){
		return $query->where('email',$email);
	}

	public function scopeMobile($query,$mobile){
		return $query->where('mobile',$mobile);
	}
}