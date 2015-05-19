<?php

// Custom Validator
Validator::extend('phoneoremail', function($attribute, $value, $parameters) {
    return (preg_match('/^(((1(3|4|5|7|8)[0-9]{1}))+\d{8})$/', $value) || preg_match("/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/", $value));
});

Validator::extend('cnphone', function($attribute, $value, $parameters) {
    return (preg_match('/^(((1(3|4|5|7|8)[0-9]{1}))+\d{8})$/', $value));
});

Validator::extend('checkpsw', function($attribute, $value, $parameters) {
    return Hash::check($value, $parameters[0]);
});

Validator::extend('phone_verify_code', function($attribute, $value, $parameters) {

    $authCode = AuthCode::type('mobile')->mobile($parameters[0])->code($value)->valid()->count();

    return $authCode > 0;
});

Validator::extend('password', function($attribute, $value, $parameters) {

    return preg_match("/^[a-zA-Z0-9!#$@_\-=+]{" . $parameters[0] . "," . $parameters[1] . "}$/", $value);
});

Validator::extend('zip',function($attribute, $value, $parameters){
     return preg_match("/^[1-9]\d{5}$/", $value);
});

Validator::extend('bank_account',function($attribute, $value, $parameters){
    return preg_match("/^[0-9]{19}$/", $value);
});

Validator::extend('id_card',function($attribute, $value, $parameters){
    return preg_match("/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/", $value);
});

Validator::extend('chinese_name', function($attribute, $value, $parameters) {

    return preg_match("/^[\x{4e00}-\x{9fa5}]{" . $parameters[0] . "," . $parameters[1] . "}$/u", $value);
});


Validator::extend('apply_reg', function($attribute, $value, $parameters) {
   $count = Merchant::where('mobile',$value)->where('status','>',0)->count();
    Log::info($count);
    return $count > 0 ? false:true ;
});
