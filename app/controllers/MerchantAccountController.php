<?php

class MerchantAccountController extends BaseController {


    //财务管理页
    public function getIndex(){

        $merchant = Auth::merchant()->user();
        if($merchant->merchant_grade == 3){
            $account_logs = MerchantAccountLog::merchant()->ofType()->take(2)->get();
            return View::make('merchants.account.ba')
                ->with('merchant',$merchant)
                ->with('logs',$account_logs);
        }else{
            $followers = $merchant->followers;
            return View::make('merchants.account.store_or_agent')
                ->with('merchant',$merchant)
                ->with('followers',$followers);
        }

    }

    //提现记录列表
    public function getList(){
        $account_logs = MerchantAccountLog::merchant()->ofType()->latest()->get();
        return View::make('merchants.account.list')
                    ->with('logs',$account_logs);
    }

    //提现申请页
    public function  getApply(){
        $merchant = Auth::merchant()->user();
        return View::make('merchants.account.apply')
                    ->with('merchant',$merchant);
    }

    //申请提现操作
    public function postApply(){
        $money = Input::get('money');
        $merchant = Auth::merchant()->user();
        $account = $merchant->account;
        if($account->status <= 0){
            return Redirect::route('merchants.account.apply')->withErrors(array('error'=>'请先完善您的账户信息!'));
        }
        if(!isset($money) || empty($money)){
            return Redirect::route('merchants.account.apply')->withErrors(array('error'=>'提现金额不能为空!'));
        }else if($money<=0){
            return Redirect::route('merchants.account.apply')->withErrors(array('error'=>'提现金额须为0以上整数!'));
        }
        if($money > $merchant->money){
            return Redirect::route('merchants.account.apply')->withErrors(array('error'=>'账户余额不足!'));
        }
        try{
            DB::beginTransaction();
            $account_log = new MerchantAccountLog();
            $account_log->money = $money;
            $account_log->log = '申请提现'.$money.'元';
            $account_log->trade_type = 0;
            $account_log->operate_type = 1;
            $account_log->merchant_id = $merchant->id;
            $account_log->bank_account_id = $account->bank_account_id;
            $account_log->bank_account_name = $account->bank_account_name;
            $account_log->bank_name = $account->bank_name;
            $account_log->identity_up_image_id = $account->identity_up_image_id;
            $account_log->identity_down_image_id = $account->identity_down_image_id;
            $account_log->status = 1;

            $merchant->money = $merchant->money-$money;
            $merchant->save();
            $account_log->save();
            DB::commit();
            return Redirect::route('merchants.account.list');
        }catch (Exception $e){
            DB::rollBack();
            return Redirect::route('merchants.account.apply')->withErrors(array('error'=>'系统错误!'));
        }
    }

    //财务账户信息页
    public function getShow(){
        $account = MerchantAccount::merchant()->first();
        if($account){
            return View::make('merchants.account.info')->with('account',$account);
        }else{
            App::abort(404);
        }
    }

    //修改账户信息
    public function postUpdate(){
        $data = array(
            'alipay_account' => Input::get('alipay_account'),
            'alipay_name' => Input::get('alipay_name')
        );
        $rules = array(
            'alipay_account' =>'required',
            'alipay_name' => 'required'
        );
        $messages = array(
            'alipay_account.required' => '请填写支付宝帐号',
            'alipay_name.required' => '请填写支付宝用户名',
        );
        $v = Validator::make($data, $rules, $messages);
        if ($v->fails()) {
            return Redirect::back()->withInput()->withErrors(array('errors'=>$v->messages()->first()));
        }else{
            $account = MerchantAccount::where('id',Input::get('id'))->merchant()->first();
            if($account){
                $account->alipay_account = $data['alipay_account'];
                $account->alipay_name = $data['alipay_name'];
                $account->status = 1;
                if($account->save()){
                    return Redirect::route('merchants.account');
                }
            }
            return Redirect::back()->withErrors(array('errors'=>'系统错误!'));

        }

//        $data = array(
//            'bank_account_id' => Input::get('bank_account_id'),
//            'bank_account_name' => Input::get('bank_account_name'),
//            'bank_name' => Input::get('bank_name')
//        );
//        $rules = array(
//            'bank_account_id' =>'required|bank_account',
//            'bank_account_name' => 'required',
//            'bank_name' => 'required'
//        );
//        $messages = array(
//            'bank_account_id.required' => '请填写提现帐户(银行卡号)',
//            'bank_account_id.bank_account' => '请输入正确的银行卡号',
//            'bank_account_name.required' => '请填写银行卡户主',
//            'bank_name.required' => '请填写开户银行名称'
//        );
//        $v = Validator::make($data, $rules, $messages);
//        if ($v->fails()) {
//            return Redirect::back()->withErrors(array('errors'=>$v->messages()->first()));
//        }else{
//            $account = MerchantAccount::where('id',Input::get('id'))->merchant()->first();
//            if($account){
//                $account->bank_account_id = $data['bank_account_id'];
//                $account->bank_account_name = $data['bank_account_name'];
//                $account->bank_name = $data['bank_name'];
//
//                if($account->identity_up_image_id && $account->identity_down_image_id){
//                    $account->status = 1;
//                }
//                if($account->save()){
//                    return Redirect::route('merchants.account');
//                }
//            }
//            return Redirect::back()->withErrors(array('errors'=>'系统错误!'));
//
//        }
    }

    //上传身份证正面照
    public function postUploadUpImage(){
        $image_file = Input::file('identity_up_image_id');
        $account = Auth::merchant()->user()->account;
        if($account){
            $configure = array(
                'attr'=>'identity_up_image_id',
                'folder'=>'IDCards',
                'relation_image_name'=>'upImage',
                'width'=>168,
                'height'=>108
            );
            try{
                $image = $this->uploadImage($image_file,$configure,true,false,$account);
                return $this->setJsonMsg(1,$image->url);
            }catch (Exception $e){
                $this->setJsonMsg(0,'系统错误!');
            }

        }else{
            return $this->setJsonMsg(0,'系统错误!');
        }
    }

    //上传身份证反面照
    public function postUploadDownImage(){
        $image_file = Input::file('identity_down_image_id');
        $account = Auth::merchant()->user()->account;
        if($account){
            $configure = array(
                'attr'=>'identity_down_image_id',
                'folder'=>'IDCards',
                'relation_image_name'=>'downImage',
                'width'=>168,
                'height'=>108
            );
            try{
                $image = $this->uploadImage($image_file,$configure,true,false,$account);
                return $this->setJsonMsg(1,$image->url);
            }catch (Exception $e){
                $this->setJsonMsg(0,'系统错误!');
            }

        }else{
            return $this->setJsonMsg(0,'系统错误!');
        }
    }

}
