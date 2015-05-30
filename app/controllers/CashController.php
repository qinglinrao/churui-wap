<?php

class CashController extends BaseController {

    public function getIndex(){
        $customer = Auth::customer()->check()?Auth::customer()->user():null;
        $logs = CustomerAccountLog::where('customer_id', $customer->id)->get();

        return View::make('customers.cash.index',compact('customer','logs'));
    }

    public function getApply(){
        $customer = Auth::customer()->check()?Auth::customer()->user():null;
        return View::make('customers.cash.apply',compact('customer'));
    }

    public function getApplyPost(){
        $data = array(
            'money' => trim(Input::get('money'))
        );
        $rules = array(
            'money' => 'required|numeric|min:1',
        );
        $messages = array(
            'money.required' => '请输入金额',
            'money.numeric' => '请输入有效数字',
            'money.min' => '最小提现金额为1元'
         );
        $v = Validator::make($data, $rules, $messages);

        if($v->fails()){
            return Redirect::route('cash.apply')->withErrors($v->messages())->withInput();
        }else{
            $customer = Auth::customer()->check()?Auth::customer()->user():null;
            if($data['money'] > $customer->money){
                return Redirect::route('cash.apply')->withErrors(array('可提取的金额不足'))->withInput();
            }
            $account_log = new CustomerAccountLog;
            $account_log->money = $data['money'];
            $account_log->log = '申请提现'.$data['money'].'元';
            $account_log->trade_type = 0;  //0--支出 1--收入
            $account_log->operate_type = 1; //1--提现 2--佣金
            $account_log->customer_id = Input::get('customer_id');

            $customer->money -=  $data['money'];
            $customer->save();
            if($account_log->save()){
                return Redirect::route('cash.apply')->withErrors(array('申请成功'))->withInput();
            }else {
                return Redirect::back()->withErrors(['error' => '系统错误!'])->withInput();
            }
        }


    }
}
