<?php

class CustomerProfileController extends BaseController {

    //客户个人中心主页
    public function getIndex(){
        $waiting_pay = Order::customer()->statusIn(get_order_status_group(1))->count();
        $waiting_receive = Order::customer()->statusIn(get_order_status_group(3))->count();
        $after_sales = Order::customer()->statusIn([7])->count();
        return View::make('customers.profiles.index')
                     ->with('waiting_pay',$waiting_pay)
                     ->with('waiting_receive',$waiting_receive)
                     ->with('after_sales',$after_sales)
                     ->with('customer',Auth::customer()->check()?Auth::customer()->user():null)
                     ->with('auth_checked',Auth::customer()->check());
    }

    //客户详细信息
    public function getDetail(){

        return View::make('customers.profiles.detail')
                     ->with('customer',Auth::customer()->check()?Auth::customer()->user():null);
    }

    //等级详情页
    public function getLevel(){

        return View::make('customers.profiles.level');
    }

    //修改绑定手机页
    public function getPhone(){

        return View::make('customers.profiles.phone')
                     ->with('customer',Auth::customer()->check()?Auth::customer()->user():null);
    }

    //修改绑定手机操作
    public function postPhone(){

        $data = array(
            'mobile' => Input::get('mobile'),
            'authcode' => Input::get('authcode')
        );

        $rules = array(
            'mobile' =>'required|cnphone|unique:customers',
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
            return Redirect::route('customers.profile.phone')->withErrors($v->messages())->withInput();
        }else{
            $customer = Auth::customer()->user();
            $detail = $customer->detail;
            $customer->mobile = $data['mobile'];
            $detail->mobile = $data['mobile'];
            DB::transaction(function() use ($detail, $customer){
                if($customer->save() &&  $detail->save()){
                    return true;
                }
            });
            return Redirect::route('customers.profile.detail');
        }


    }

    //修改密码页
    public function getPassword(){

        return View::make('customers.profiles.password');
    }

    //修改密码操作
    public function postPassword(){

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
            return Redirect::route('customers.profile.password')->withErrors($v->messages())->withInput();
        }else{
            $customer = Auth::customer()->user();
            if(!Hash::check($data['old_password'],$customer->encrypted_password)){
                return Redirect::route('customers.profile.password')->withErrors(array('old_password_error'=>'原密码输入错误'))->withInput();
            }else{
                $customer->encrypted_password = Hash::make($data['new_password']);
                if($customer->save()){
                    Auth::customer()->user()->encrypted_password = Hash::make($data['new_password']);
                    return Redirect::route('customers.profile.password')->withErrors(array('update_password_success'=>'密码修改成功'));
                }else{
                    return Redirect::route('customers.profile.password')->withErrors(array('system_error'=>'系统错误'))->withInput();
                }
            }
        }
    }

    //修改昵称页
    public function getUserName(){
        return View::make('customers.profiles.name')
                    ->with('customer',Auth::customer()->check()?Auth::customer()->user():null);
    }

    //修改昵称操作
    public function postUserName(){
        $userName = trim(htmlspecialchars(Input::get('username')));

        if($userName == ""){
            return Redirect::route('customers.profile.username')->withErrors(array('error' => '请填写昵称!'))->withInput();
        }else{
            if($userName == Auth::customer()->user()->detail->username){
                return Redirect::route('customers.profile');
            }else{
                Auth::customer()->user()->detail->username = $userName;
                if(Auth::customer()->user()->detail->save()){
                    return Redirect::route('customers.profile');
                }else{
                    return Redirect::route('customers.profile')->withErrors(array('error' => '系统错误!'))->withInput();
                }
            }
        }

    }


    //上传客户头像
    public function postUserImage(){
        $rules = array(
            'picture' => 'image|mimes:jpeg,gif,png|max:1024'
        );

        $message = array(
            'picture.image' => '请上传jpeg,gif,png格式的图片',
            'picture.mimes' => '请上传jpeg,gif,png格式的图片',
            'picture.max' => '请上传小于1MB的图片'
        );
        Log::info(Input::file('picture'));
        $v = Validator::make(Input::all(), $rules, $message);
        if ($v->fails()) {
            return Redirect::route('customers.profile.detail')->withErrors($v->messages());
        }else{
            if (Input::hasFile('picture')) {
                $file = Input::file('picture');
                $detail = Auth::customer()->user()->detail;
                $configure = array(
                    'attr'=>'image_id',
                    'folder'=>'Customers',
                    'relation_image_name'=>'image',
                    'width'=>120,
                    'height'=>120
                );
                try {
                    $image = $this->uploadImage($file, $configure, true, true, $detail);
                    return Redirect::route('customers.profile.detail');
                }catch (Exception $e){
                    return Redirect::route('customers.profile.detail');
                }
            }else{
                return Redirect::route('customers.profile.detail');
            }
        }
    }

}
