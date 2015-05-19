@extends('public/html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back" href="{{URL::route('merchants_login')}}">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">找回密码</h1>
			</div>
		</div>
		<div id="main-content">
			<div class="user-register has-padding">
			    {{Form::open(array('url'=>URL::route('merchants_forget_password'),'method'=>'post','id'=>'forget_password'))}}
			        <div class="field-wrapper">
                        <div class="label">
                            <span class="login-tip" id="login-tip">{{$errors->first()}}</span>
                        </div>
                    </div>
                    <div class="field-wrapper">
                        <input type="text" value="" name="merchant[mobile]" id="merchant_mobile" data-role="phone" class="text-field" autofocus="autofocus" placeholder="请输入您的手机号" />
                    </div>
                    <div class="field-wrapper clearfix">
                        <input type="text" placeholder="请输入验证码" name="merchant[authcode]" id="merchant_authcode" class="auth-code-field text-field" />
                        <a class="get-code-button" id="get-phone-code">获取验证码</a>
                    </div>
                    <div class="field-wrapper">
                        <input type="password" placeholder="请输入密码" name="merchant[password]" id="merchant_password" class="text-field" autocomplete="off" />
                        <span href="#" data-target="#user_password" class="toggle-password-text"><span>toggle</span></span>
                    </div>
                    <div class="field-wrapper">
                        <input type="password" placeholder="确认密码" name="merchant[repassword]" id="merchant_repassword" class="text-field" autocomplete="off" />
                        <span href="#" data-target="#user_password" class="toggle-password-text"><span>toggle</span></span>
                    </div>

                    <div class="field-wrapper">
                        <input type="submit" value="确定" name="commit" class="submit-field" id="submit-btn" />
                    </div>
                {{Form::close()}}
			</div>
		</div>
	</div>
@stop
@stop