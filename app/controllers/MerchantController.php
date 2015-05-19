<?php

class MerchantController extends BaseController {

    //商家登录页
	public function getLogin(){
		return View::make('merchants.login');
	}

    //商家登录操作
	public function postLogin(){
        $data = array(
            'mobile' => Input::get('mobile'),
            'password' => Input::get('password'),
        );
        $rules = array(
            'mobile' =>'required|cnphone',
            'password' => 'required'
        );
        $messages = array(
            'mobile.required' => '请填写手机号',
            'mobile.cnphone' => '请填写正确格式的手机号',
            'password.required' => '请填写密码!'
        );
        $v = Validator::make($data, $rules, $messages);
        if ($v->fails()) {
            return $this->setJsonMsg(0,$v->messages()->first());
        }else{
           $merchant = Merchant::where('mobile',$data['mobile'])->first();
           if(!$merchant){
               return $this->setJsonMsg(0,'帐号不存在!');
           }else if($merchant->status == 0){
               return $this->setJsonMsg(0,'您的入驻申请未通过!');
           }else if($merchant->status == 1){
               return $this->setJsonMsg(0,'您的入驻申请还在审核中...!');
           }else if($merchant->status == 3){
               return $this->setJsonMsg(0,'您的帐号已被冻结!');
           }
           else if(!Hash::check($data['password'], $merchant->encrypted_password)){
               return $this->setJsonMsg(0,'密码错误!');
           }else{
                Auth::merchant()->login($merchant);
//               $redirectUrl = Session::has('redirectUrl') ? Session::get('redirectUrl') : URL::route('merchants.home');
//               Session::forget('redirectUrl');
               $redirectUrl =  URL::route('merchants.home');
               return $this->setJsonMsg(1,$redirectUrl);
           }

        }
	}

    //商家注册页
	public function getRegister(){
		return View::make('merchants.register')->with('MID',get_merchant_id_from_url());
	}

    //商家注册操作
	public function postRegister(){

       $data = Input::get('merchant');

        $rules = array(
            'mobile' =>"required|cnphone|unique:merchants",
            'authcode' => "required",
            'authcode' => "required|phone_verify_code:{$data['mobile']}",
            'password' => 'required|password:6,20',
            'real_name' => 'required',
            'identity_num' => 'required'
        );
        $messages = array(
            'mobile.required' => '请填写手机号',
            'mobile.cnphone' => '请填写正确格式的手机号',
            'mobile.unique' => '此手机号已注册过',
            'authcode.required' => '请填写验证码',
            'password.required' => '请填写密码',
            'password.password' => '密码由6-20位数字,字母,符号组成',
            'authcode.phone_verify_code' => '验证码错误或已失效',
            'real_name.required' => '请输入姓名',
            'identity_num.required' => '请输入身份证号'
        );

        $v = Validator::make($data, $rules, $messages);

        if ($v->fails()) {
            return Redirect::route('merchants_login')->withInput()->withErrors(array('error'=>$v->messages()->first()));
        }else{
            $merchant = new Merchant();
            $merchant->username = $data['mobile'];
            $merchant->mobile = $data['mobile'];
            $merchant->encrypted_password = Hash::make($data['password']);
            $merchant->real_name = $data['real_name'];
            $merchant->identity_num = $data['identity_num'];
            $merchant->status = 1;

            $mid = judge_right_MID($data['MID']);
            $leader = Merchant::where('id',$mid)->first();
            if($leader){
                $merchant->merchant_grade = $leader->merchant_grade + 1;
                $merchant->leader = $leader->id;
            }else{
                $merchant->merchant_grade = 3;
                $merchant->leader = 0;
            }
            try{
                DB::beginTransaction();
                if($merchant->save()){
                    $account = new MerchantAccount();
                    $account->status = 0;
                    $account->merchant_id = $merchant->id;
                    $account->save();
                }
                DB::commit();
                Auth::merchant()->login($merchant);
                return Redirect::route('merchants_home');
            }catch (Exception $e){
                DB::rollBack();
                return Redirect::route('merchants_login')->withInput()->withErrors(array('error'=>'系统错误!'));
            }
        }
	}


    //申请加盟页面
    public function getApplyJion(){
        return View::make('merchants.apply')->with('MID',Session::get('JC'));
    }

    //申请加盟操作
    public function postDealApply(){
        $data = Input::get('merchant');

        $rules = array(
            'mobile' =>"required|cnphone|apply_reg",

//            'identity_num' => 'required|id_card',
            'weixin' => 'required',
            'real_name' => 'required|chinese_name:2,4',
            'sex' => 'required|integer|between:0,1',
            'age' => 'required|integer|between:1,125',
            'MID' =>  'required',
        );
        $messages = array(
            'mobile.required' => '请填写手机号',
            'mobile.cnphone' => '请填写正确格式的手机号',
            'mobile.apply_reg' => '此手机号已注册过',
            'real_name.required' => '请填写真实姓名',
            'real_name.chinese_name' => '真实姓名限定为2~4个汉字',
//            'identity_num.required' => '请输入身份证号',
//            'identity_num.id_card' => '身份证号格式不正确',
            'weixin.required' => '请填写微信号',
            'sex.required' => '请选择性别',
            'sex.integer' => '请选择性别',
            'sex.between' => '请选择性别',
            'age.required' => '请填写年龄',
            'age.integer' => '年龄须为整数',
            'age.between' => '请填写正确的年龄值',
            'MID.required' => '申请入驻有效性不合法！',
        );

        $v = Validator::make($data, $rules, $messages);

        if ($v->fails()) {
            return Redirect::route('merchants.apply_join',array('MID'=>$data['MID']))->withInput()->withErrors(array('error'=>$v->messages()->first()));
        }else{

            $leader = Merchant::where('id',judge_right_MID($data['MID']))->where('merchant_grade',2)->first();
            if($leader){
//                if($leader->merchant_grade < 3){
                    $merchant = new Merchant();
                    $old_merchant = Merchant::where('mobile',$data['mobile'])->where('status',0)->first();
                    if($old_merchant){
                        $merchant = $old_merchant;
                    }
                    $merchant->username = $data['real_name'];
                    $merchant->mobile = $data['mobile'];
                    $merchant->encrypted_password = Hash::make(substr($data['mobile'],strlen($data['mobile'])-6,6));
                    $merchant->real_name = $data['real_name'];
//                    $merchant->identity_num = $data['identity_num'];
                    $merchant->status = 1;
                    $merchant->leader_id = $leader->id;
//                    $merchant->merchant_grade = $leader->merchant_grade + 1 ;
                    $merchant->merchant_grade = 3 ;
                    $merchant->remember_token = '';
                    $merchant->sex = $data['sex'];
                    $merchant->age = $data['age'];
                    $merchant->weixin = $data['weixin'];

                    if($merchant->save()){
                        return Redirect::route('merchants.apply_join',array('MID'=>$data['MID']))->withErrors(array('error'=>'申请成功,请耐心等待审核!审核通过后会以短信形式及时通知您'));
                    }else{
                        return Redirect::route('merchants.apply_join',array('MID'=>$data['MID']))->withInput()->withErrors(array('error'=>'系统发生错误!'));
                    }
//                }
            }
            return Redirect::route('merchants.apply_join',array('MID'=>$data['MID']))->withInput()->withErrors(array('error'=>'申请入驻有效性不合法!'));

        }
    }


    //商家注册检测
    public function postRegisterCheck(){

        $data = array(
            'mobile' => Input::get('mobile'),
            'authcode' => Input::get('authcode')
        );

        $rules = array(
            'mobile' =>"required|cnphone|unique:merchants",
            'authcode' => "required|phone_verify_code:{$data['mobile']}"
        );

        $messages = array(
            'mobile.required' => '请填写手机号',
            'mobile.cnphone' => '请填写正确格式的手机号',
            'mobile.unique' => '此手机号已注册过',
            'authcode.required' => '请填写验证码',
            'authcode.phone_verify_code' => '验证码错误或已失效'
        );

        $v = Validator::make($data, $rules, $messages);

        if ($v->fails()) {
            $result['state'] = 0;
            $result['msg'] = $v->messages()->first();
        }else{
            $result['state'] = 1;
        }

        return Response::json($result);


    }



    //忘记密码页
    public function getForgetPassword(){
        return View::make('customers.forget_password');
    }

    //忘记密码操作
    public function postForgetPassword(){
        $data = Input::get('merchant');
        $rules = array(
            'mobile' =>"required|cnphone",
            'authcode' => "required",
            'authcode' => "required|phone_verify_code:{$data['mobile']}",
            'password' => 'required|password:6,20'
        );
        $messages = array(
            'mobile.required' => '请填写手机号',
            'mobile.cnphone' => '请填写正确格式的手机号',
            'authcode.required' => '请填写验证码',
            'password.required' => '请填写密码',
            'password.password' => '密码由6-20位数字,字母,符号组成',
            'authcode.phone_verify_code' => '验证码错误或已失效'
        );
        $v = Validator::make($data, $rules, $messages);
        if ($v->fails()) {
            return $this->setJsonMsg(0,$v->messages()->first());
        }else{
            $merchant = Merchant::where('mobile',$data['mobile'])->first();
            if($merchant){
                $merchant->encrypted_password = Hash::make($data['password']);
                if($merchant->save()){
                    Auth::merchant()->login($merchant);
                    return Redirect::route('customers.profile');
                }
            }
            return Redirect::route('merchants_forget_password')->withInput()->withErrors(array('error'=>'系统错误!'));
        }
    }

    //商家个人中心首页
    public function getIndex(){

        $merchant = Auth::merchant()->user();
        return View::make('merchants.home.index')
                        ->with('merchant',$merchant);
    }

    //我的客户列表
    public function getCustomers(){
        $sort = Input::get('sort') ? Input::get('sort') : 'created_at';
        $leader_id = Input::get('leader_id') ? base64_decode(Input::get('leader_id')) : Auth::merchant()->user()->id;
        $leader = Merchant::where('id',$leader_id)->first();
        if($leader){
            $customers = Customer::with('detail.image')->where('merchant_id',$leader->id)->orderBy($sort,'desc')->get();
            return View::make('merchants.customer.index')
                ->with('customers',$customers)
                ->with('sort',$sort)
                ->with('leader',$leader);
        }else{
            App::abort(404);
        }

    }

    //我的订单列表
    public function getOrderList(){
        $status = Input::get('status')?Input::get('status'):10;
        $leader_id = Input::get('leader_id') ? base64_decode(Input::get('leader_id')) : Auth::merchant()->user()->id;
        $leader = Merchant::where('id',$leader_id)->first();
        if($leader){
                $orders = Order::with(array('products.product.image','buyer.detail.image','products'=>function($query) use($leader) {
                    $query->shop($leader);
                }))
                ->whereHas('products',function($query) use($leader){
                    $query->shop($leader);
                })
                ->orderBy('updated_at','desc');
                if($status == 10){
                    $orders = $orders->where(function($query){
                       $query->whereIn('status_id',[1,2])->orWhere('is_profited',1);
                    });
                }else if($status == 9){
                    $orders = $orders->where('is_profited',1);
                }else{
                    $orders = $orders->statusIn(get_order_status_group($status));
                }
                $orders = $orders->get();
            return View::make('merchants.order.index')
                ->with('orders',$orders)
                ->with('status',$status)
                ->with('leader',$leader);
        }else{
            App::abort(404);
        }

    }

    //下级管理页（如门店管理、BA管理）
    public function getFollowerManger(){
        $merchant = Auth::merchant()->user();
        return View::make('merchants.follower.manage')->with('merchant',$merchant);
    }

    //入驻审核列表页
    public function getApplyList(){
        $merchants = Merchant::where('leader_id',Auth::merchant()->user()->id)->visible()->get();
        return View::make('merchants.follower.apply')->with('merchants',$merchants);
    }

    //处理入驻申请操作
    public function getChangeApplyStatus(){
        $merchant_id = Input::get('merchant_id');
        $status = Input::get('status');
        if(!in_array($status,array('0','2'))){
            return Redirect::back()->withErrors(array('error'=>'不合法的操作!'));
        }else{
            $merchant = Merchant::where('leader_id',Auth::merchant()->user()->id)->visible()->where('id',$merchant_id)->first();
            if($merchant){
                $merchant->status = $status;
                if($status == 2){
                    $sendState = Yimei::sendSMS([$merchant->mobile],'【UNES优理氏】您好，您的入驻申请已审核通过,登录初始密码为您填写的手机号码后六位！请及时登录修改密码！');
                    $leader = $merchant->leader;
                    if($leader){
                        $leader->follower_num += 1;
                        $leader->save();
                    }
                    if($sendState === '0'){
                        if($merchant->save()){
                            return Redirect::back();
                        }
                    }
                }else{
                    $sendState = Yimei::sendSMS([$merchant->mobile],'【UNES优理氏】您好，您的入驻申请未通过,您可以重填资料再次申请！');
                    $merchant->visible = 0;
                    if($sendState === '0'){
                        if($merchant->save()){
                            return Redirect::back();
                        }
                    }

                }
            }
            return Redirect::back()->withErrors(array('error'=>'系统错误!'));
        }
    }

    //我的下级类表(如门店列表、BA列表)
    public function getFollowerList(){
        $sort = Input::get('sort') ? Input::get('sort') :'created_at';
        $leader_id = Input::get('leader_id') ? base64_decode(Input::get('leader_id')) :Auth::merchant()->user()->id;
        $leader = Merchant::where('id',$leader_id)->first();
        if($leader){
            $merchants = Merchant::where('leader_id',$leader->id)->visible()->whereNotIn('status',[0,1])->orderBy($sort,'desc')->get();
            return View::make('merchants.follower.list')
                ->with('merchants',$merchants)
                ->with('sort',$sort)
                ->with('leader',$leader);
        }else{
            App::abort(404);
        }

    }

    //下级商家详细信息
    public function getFollowerDetail($merchant_id){
        $merchant = Merchant::where('id',$merchant_id)->first();
        if($merchant){
            return View::make('merchants.follower.detail')->with('merchant',$merchant);
        }else{
            App::abort(404);
        }

    }

    //我的个人信息
    public function getPersonalInfo(){
        $merchant = Auth::merchant()->user();
        return View::make('merchants.info.show')->with('merchant',$merchant);
    }

    //个人信息编辑页
    public function getEditPersonalInfo(){
        $merchant = Auth::merchant()->user();
        return View::make('merchants.info.edit')->with('merchant',$merchant);
    }

    //个人信息更新操作
    public function postUpdatePersonalInfo(){
        $data = array(
            'username' => Input::get('username'),
            'region' => Input::get('region'),
            'sex' => Input::get('sex'),
            'age' => Input::get('age'),
        );
        $rules = array(
            'username' =>"required",
            'region' => "required",
            'sex' => 'required|integer|between:0,1',
            'age' => 'required|integer|between:1,125'
        );
        $messages = array(
            'username.required' => '请填写昵称',
            'region_id.required' => '请选择地区',
            'sex.required' => '请选择性别',
            'sex.integer' => '请选择性别',
            'sex.between' => '请选择性别',
            'age.required' => '请填写年龄',
            'age.integer' => '年龄须为整数',
            'age.between' => '请填写正确的年龄值'
        );

        $v = Validator::make($data, $rules, $messages);

        if ($v->fails()) {
            return Redirect::route('merchants.info.edit')->withErrors(array('error'=>$v->messages()->first()));
        }else{
            $merchant = Auth::merchant()->user();
            $merchant->username = $data['username'];
            $merchant->sex = $data['sex'];
            $merchant->age = $data['age'];
            $merchant->region = $data['region'];
            if($merchant->save()){
                return Redirect::route('merchants.info');

            }else{
                return Redirect::route('merchants.info.edit')->withErrors(array('error'=>'系统错误!'));
            }


        }
    }

    //上传个人头像
    public function postUploadImage(){

        $image_file = Input::file('image_id');
        $merchant = Auth::merchant()->user();
        $configure = array(
            'attr'=>'image_id',
            'folder'=>'Merchants',
            'relation_image_name'=>'image',
            'width'=>120,
            'height'=>120
        );
        try{
            $image = $this->uploadImage($image_file,$configure,true,true,$merchant);
            return $this->setJsonMsg(1,$image->url);
        }catch (Exception $e){
            $this->setJsonMsg(0,'系统错误!');
        }


    }

    //冻结(解冻)下级商家帐号操作（如冻结(解冻)门店、BA）
    public function getChangeMerchantStatus(){
        $merchant_id = Input::get('merchant_id');
        $status = Input::get('status');
        $merchant = Merchant::where('id',base64_decode($merchant_id))->first();
        if(!in_array($status,array('2','3'))){
            return Redirect::back()->withErrors(array('error'=>'不合法的操作!'));
        }else {
            if ($merchant) {
                $merchant->status = $status;
                if ($merchant->save()) {
                    return Redirect::back();
                } else {
                    return Redirect::back()->withErrors(array('error' => '系统错误!'));
                }
            } else {
                App::abort(404);
            }
        }

    }

    //软删除下级商家帐号(如删除门店、BA)
    public function getSoftDelete($merchant_id){
        $merchant = Merchant::where('id',base64_decode($merchant_id))->first();
        if($merchant){
            $merchant->visible = 0;
            if($merchant->save()){
                if($merchant->leader_id)
                    return Redirect::route('merchants.follower.list',array('leader_id'=>base64_encode($merchant->leader_id)));
                else
                    return Redirect::route('merchants.follower.list');
            }else{
                return Redirect::back()->withErrors(array('error'=>'系统错误!'));
            }
        }else{
            App::abort(404);
        }
    }

    //商家退出系统
    public function getLogout(){
        Auth::merchant()->logout();
        return Redirect::route('merchants_login');
    }

    //修改密码页
    public function getEditPassword(){
        return View::make('merchants.info.password');
    }

    //更新密码操作
    public function postUpdatePassword(){
        $data = array(
            'old_password' => Input::get('old_password'),
            'new_password' => Input::get('new_password'),
            'new_password_confirmation' => Input::get('new_password_confirmation')
        );

        $rules = array(
            'old_password' => 'required',
            'new_password' => 'required|password:6,20|confirmed',
            'new_password_confirmation' => 'required'

        );
        $messages = array(
            'old_password.required' => '请填写原密码',
            'new_password.required' => '请填写新密码',
            'new_password_confirmation.required' => '请再次输入新密码',
            'new_password.password' => '新密码必须是由6-20位数字,字母,符号组成',
            'new_password.confirmed' => '两次输入的新密码不相符'
        );
        $v = Validator::make($data, $rules, $messages);
        if($v->fails()){
            return Redirect::route('merchants.info.edit_password')->withErrors($v->messages())->withInput();
        }else{
            $merchant = Auth::merchant()->user();
            if(!Hash::check($data['old_password'],$merchant->encrypted_password)){
                return Redirect::route('merchants.info.edit_password')->withErrors(array('old_password_error'=>'原密码输入错误'))->withInput();
            }else{
                $merchant->encrypted_password = Hash::make($data['new_password']);
                if($merchant->save()){
                    return Redirect::route('merchants.info.edit_password')->withErrors(array('update_password_success'=>'密码修改成功'));
                }else{
                    return Redirect::route('merchants.info.edit_password')->withErrors(array('system_error'=>'系统错误'))->withInput();
                }
            }
        }
    }

    //修改绑定手机页
    public function getEditMobile(){
        $merchant = Auth::merchant()->user();
        return View::make('merchants.info.phone')->with('merchant',$merchant);
    }

    //修改绑定手机操作
    public function postUpdateMobile(){
        $data = array(
            'mobile' => Input::get('mobile'),
            'authcode' => Input::get('authcode')
        );

        $rules = array(
            'mobile' =>'required|cnphone|unique:merchants',
            'authcode' => "required|phone_verify_code:{$data['mobile']}",
        );
        $messages = array(
            'mobile.required' => '请填写手机号',
            'mobile.cnphone' => '请填写正确格式的手机号',
            'mobile.unique' => '此手机号已注册过',
            'authcode.required' => '请填写验证码',
            'authcode.phone_verify_code' => '验证码错误或已失效'
        );
        $v = Validator::make($data, $rules, $messages);
        if($v->fails()){
            return Redirect::route('merchants.info.edit_mobile')->withErrors($v->messages())->withInput();
        }else{
            Log::info("customer details ");
            $merchant = Auth::merchant()->user();
            $merchant->mobile = $data['mobile'];
            if($merchant->save()){
                return Redirect::route('merchants.info.edit_mobile')->withErrors(array('error'=>'成功绑定手机号'.$data['mobile']));
            }else{
                return Redirect::route('merchants.info.edit_mobile')->withErrors(array('error'=>'系统错误!'));
            }

        }
    }

    //代理商申请加盟
    public function getAgentApplyJoin(){

        $regions = Region::provinces()->get();
        return View::make('merchants.agent_apply',compact('regions'));
    }

    //处理代理商加盟申请
    public function postDealAgentApply(){
        $data = Input::get('merchant');

        $rules = array(
            'mobile' =>"required|cnphone|apply_reg",
            'password' => 'required|password:6,20',
            'weixin' => 'required',
            'company' => 'required',
            'real_name' => 'required|chinese_name:2,4',
            'responsible_area' =>'required'
        );
        $messages = array(
            'mobile.required' => '请填写手机号',
            'mobile.cnphone' => '请填写正确格式的手机号',
            'mobile.apply_reg' => '此手机号已注册过',
            'password.required' => '请填写密码',
            'password.password' => '密码须由6～10字母或数字组成',
            'weixin.required' => '请填写微信号',
            'company.required' => '请填写公司名称',
            'real_name.required' => '请填写负责人姓名',
            'real_name.chinese_name' => '负责人姓名限定为2~4个汉字',
            'responsible_area.required' => '填写区域，例如：广东省广州市',
        );

        $v = Validator::make($data, $rules, $messages);

        if ($v->fails()) {
            return Redirect::back()->withInput()->withErrors(array('error'=>$v->messages()->first()));
        }else {

            $merchant = new Merchant();
            $old_merchant = Merchant::where('mobile',$data['mobile'])->where('status',0)->first();
            if($old_merchant){
                $merchant = $old_merchant;
            }
            $merchant->username = $data['real_name'];
            $merchant->mobile = $data['mobile'];
            $merchant->encrypted_password = Hash::make($data['password']);
            $merchant->real_name = $data['real_name'];
            $merchant->status = 1;
            $merchant->leader_id = 0;
            $merchant->merchant_grade = 1;
            $merchant->remember_token = '';
            $merchant->weixin = $data['weixin'];
            $merchant->company = $data['company'];
            $merchant->responsible_area = $data['responsible_area'];
            if ($merchant->save()) {
                return Redirect::back()->withErrors(array('error' => '申请成功,请耐心等待审核!审核通过后会以短信等形式及时通知您'));
            } else {
                return Redirect::back()->withInput()->withErrors(array('error' => '系统发生错误!'));
            }
        }

    }


    //门店申请加盟
    public function getStoreApplyJoin(){

        $merchant = Merchant::where('id',base64_decode(Session::get('JC')))->where('merchant_grade',1)->first();
        if(!$merchant){
            App::abort(404);
        }else{
            return View::make('merchants.store_apply',compact('merchant'));
        }

    }

    //处理门店加盟申请
    public function postDealStoreApply(){
        $data = Input::get('merchant');

        $rules = array(
            'mobile' =>"required|cnphone|apply_reg",
            'weixin' => 'required',
            'real_name' => 'required|chinese_name:2,4',
            'shop_name' => 'required',
            'shop_address' => 'required',
            'responsible_area' =>'required'
        );
        $messages = array(
            'mobile.required' => '请填写手机号',
            'mobile.cnphone' => '请填写正确格式的手机号',
            'mobile.apply_reg' => '此手机号已注册过',
            'weixin.required' => '请填写微信号',
            'real_name.required' => '请填写姓名',
            'real_name.chinese_name' => '姓名限定为2~4个汉字',
            'shop_name.required' => '请填写店铺名称',
            'shop_address.required' => '请填写店铺地址',
            'responsible_area.required' => '填写区域，例如：广东省广州市',
        );

        $v = Validator::make($data, $rules, $messages);

        if ($v->fails()) {
            return Redirect::back()->withInput()->withErrors(array('error'=>$v->messages()->first()));
        }else {

            $merchant = new Merchant();
            $old_merchant = Merchant::where('mobile',$data['mobile'])->where('status',0)->first();
            if($old_merchant){
                $merchant = $old_merchant;
            }
            $merchant->username = $data['real_name'];
            $merchant->mobile = $data['mobile'];
            $merchant->encrypted_password = Hash::make(substr($data['mobile'], strlen($data['mobile']) - 6, 6));
            $merchant->real_name = $data['real_name'];
            $merchant->status = 1;
            $merchant->leader_id = judge_right_MID($data['MID']);
            $merchant->merchant_grade = 2;
            $merchant->remember_token = '';
            $merchant->weixin = $data['weixin'];
            $merchant->shop_name = $data['shop_name'];
            $merchant->shop_address = $data['shop_address'];
            $merchant->responsible_area = $data['responsible_area'];
            $merchant->visible = 1;

            if ($merchant->save()) {
               return Redirect::back()->withErrors(array('error' => '申请成功,请耐心等待审核!审核通过后会以短信等形式及时通知您'));
            } else {
               return Redirect::back()->withInput()->withErrors(array('error' => '系统发生错误!'));
            }
            return Redirect::back()->withErrors(array('error' => '申请成功,请耐心等待审核!审核通过后会以短信等形式及时通知您'));
        }

    }









}
