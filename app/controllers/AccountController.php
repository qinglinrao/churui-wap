<?php

class AccountController extends BaseController {

    public function getIndex(){
        $customer = Auth::customer()->check()?Auth::customer()->user():null;
        $account = CustomerAccount::where('customer_id',$customer->id)->with('front_image','back_image')->first();

        return View::make('customers.account.index',compact('account'));
    }
}
