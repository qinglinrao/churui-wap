<?php

class AccountController extends BaseController {
    public $customer;

    function __construct() {
        $this->customer = Auth::customer()->check()?Auth::customer()->user():null;
    }

    public function getIndex(){
        $account = CustomerAccount::where('customer_id',$this->customer->id)->with('front_image','back_image')->first();
        return View::make('customers.account.index',compact('account'));
    }

    public function postEdit(){
        $account = CustomerAccount::where('customer_id',$this->customer->id)->first();

        if($account){
           try{
                DB::beginTransaction();
               $account->alipay_account = Input::get('alipay_account');
               $account->alipay_name = Input::get('alipay_name');
               $account->cash_account = Input::get('cash_account');
               $account->cash_name = Input::get('cash_name');
               $account->bank_name = Input::get('bank_name');
               $account->update();
                DB::commit();
            }catch (Exception $e){
                DB::rollback();
                return Redirect::back()->withErrors(array('系统错误'))->withInput();
            }

            return Redirect::route('account.index');
        }else{
            try{
                DB::beginTransaction();
                $account = new CustomerAccount();
                $account->alipay_account = Input::get('alipay_account');
                $account->alipay_name = Input::get('alipay_name');
                $account->cash_account = Input::get('cash_account');
                $account->cash_name = Input::get('cash_name');
                $account->bank_name = Input::get('bank_name');
                $account->customer_id = $this->customer->id;
                $account->save();

                DB::commit();
            }catch (Exception $e){
                DB::rollback();
                return Redirect::back()->withErrors(array('系统错误'))->withInput();
            }
            return Redirect::route('account.index');
        }
    }
}
