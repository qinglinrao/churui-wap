<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-2-9
 * Time: 下午4:57
 */

class CustomerController extends BaseController{

    //跳转向客户登录界面
    public function getLogin(){
        return View::make('customers.login');
    }

    //客户登录操作
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
            $customer = Customer::where('mobile',$data['mobile'])->first();
            if(!$customer){
                return $this->setJsonMsg(0,'帐号不存在!');
            }else if(!$customer->confirmed){
                return $this->setJsonMsg(0,'您的帐号还未激活!');
            }
            else if(!Hash::check($data['password'], $customer->encrypted_password)){
                return $this->setJsonMsg(0,'密码错误!');
            }else{
                Auth::customer()->login($customer);
                $redirectUrl = Session::has('redirectUrl') ? Session::get('redirectUrl') : URL::route('customers.profile');
                Session::forget('redirectUrl');
                return $this->setJsonMsg(1,$redirectUrl);
            }

        }
    }

    //跳转向客户注册页面
    public function getRegister(){
        return View::make('customers.register')->with('MID',Session::get('MID'));
    }

    //客户注册操作
    public function postRegister(){
        $data = array(
            'mobile' => Input::get('mobile'),
            'password' => Input::get('password'),
            'authcode' => Input::get('authcode'),
            'merchant_id' => judge_right_MID(Input::get('merchant_id'))
        );
        $rules = array(
            'mobile' =>"required|cnphone|unique:customers",
            'authcode' => "required|phone_verify_code:{$data['mobile']}",
            'password' => 'required|password:6,20'
        );
        $messages = array(
            'mobile.required' => '请填写手机号',
            'mobile.cnphone' => '请填写正确格式的手机号',
            'mobile.unique' => '此手机号已注册过',
            'authcode.required' => '请填写验证码',
            'password.required' => '请填写密码',
            'password.password' => '密码由6-20位数字,字母,符号组成',
            'authcode.phone_verify_code' => '验证码错误或已失效'
        );

        $v = Validator::make($data, $rules, $messages);

        if ($v->fails()) {
            return $this->setJsonMsg(0,$v->messages()->first());
        }else{
            Log::info($data['merchant_id']);
            $customer = new Customer;
            $customer->level_id = 1;
            $customer->mobile = $data['mobile'];
            $customer->encrypted_password = Hash::make($data['password']);
            $customer->confirmed = 1;
            $customer->merchant_id = $data['merchant_id'];
            $customer->status = 1;

            DB::transaction(function() use ($customer,$data){
                if($customer->save()){
                    $customer_detail = new CustomerDetail;
                    $customer_detail->customer_id = $customer->id;
                    $customer_detail->username = $data['mobile'];
                    $customer_detail->save();

                    $leader = $customer->leader;
                    if($leader){
                        $leader->follower_num += 1;
                        $leader->save();
                    }
                }
            });

            Auth::customer()->login($customer);
            $redirectUrl = Session::has('redirectUrl') ? Session::get('redirectUrl') : URL::route('customers.profile');
            Session::forget('redirectUrl');

            return $this->setJsonMsg(1,$redirectUrl);
        }
    }

    //客户注册合法性检测（手机号合法性检测）
    public function postRegisterCheck(){

        $data = array(
            'mobile' => Input::get('mobile')
        );

        $rules = array(
            'mobile' =>"required|cnphone|unique:customers"
        );

        $messages = array(
            'mobile.required' => '请填写手机号',
            'mobile.cnphone' => '请填写正确格式的手机号',
            'mobile.unique' => '此手机号已注册过'
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


    //关于我们
    public function getAboutUs(){

        return View::make('customers.about_us');
    }

    //产品服务信息
    public function getProductService(){
        $product_services = ProductService::all();

        return View::make('customers.product_service')
            ->with('product_services',$product_services);
    }


    //客户退出系统操作
    public function getLogOut(){
        Auth::customer()->logout();
        return Redirect::route('customers.login');
    }



} 