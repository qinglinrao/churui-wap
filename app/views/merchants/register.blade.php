@extends('public.html')

@section('wrapper')

	<div id="main-wrapper">

		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back" href="{{URL::route('merchants_login')}}">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">申请入驻</h1>
			</div>
		</div>

		<div id="main-content">
			<div class="user-register has-padding">
				{{--<form method="post" id="new_merchant" class="new_customer" action="/users/register" accept-charset="UTF-8">--}}
				{{Form::open(array('url'=>URL::route('merchants_register'),'method'=>'post','id'=>'new_merchant','class'=>'new_merchant'))}}
					<div id="step-1">
						<div class="field-wrapper">
							<input type="text" value="" name="merchant[mobile]" id="customer_phone" data-role="phone" class="text-field" autofocus="autofocus" placeholder="请输入您的手机号" />
						</div>
						<div class="field-wrapper clearfix">
                            <input type="text" placeholder="请输入验证码" name="merchant[authcode]" id="authcode" class="auth-code-field text-field" />
                            <a class="get-code-button" id="get-phone-code">获取验证码</a>
                        </div>
						<div class="field-wrapper term-field clearfix">
							<div class="icheckbox checked" style="position: relative;">
								<input type="checkbox" value="1" name="term" id="termcheck" checked="checked" style="position: absolute; opacity: 0;" />
								<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: none repeat scroll 0% 0% rgb(255, 255, 255); border: 0px none; opacity: 0;"></ins>
							</div>
							<span class="term">注册即表示已阅读并同意<a href="#"><span>用户注册协议</span></a></span>
						</div>

						<div class="field-wrapper">
                            <a id="next-step-one" class="submit-field next-register-step"><span>下一步</span></a>
                        </div>
					</div>
					<div id="step-2" class="hide">
						<div class="field-wrapper">
							<input type="password" placeholder="请输入密码" name="merchant[password]" id="password" class="text-field" autocomplete="off" />
							<span href="#" data-target="#user_password" class="toggle-password-text"><span>toggle</span></span>
						</div>
						<div class="field-wrapper">
                            <input type="password" placeholder="确认密码" name="merchant[repassword]" id="repassword" class="text-field" autocomplete="off" />
                            <span href="#" data-target="#user_password" class="toggle-password-text"><span>toggle</span></span>
                        </div>
						<div class="field-wrapper">
                            <a id="next-step-two" class="submit-field next-register-step"><span>下一步</span></a>
                        </div>
					</div>
					<div id="step-3" class="hide">
                        <div class="field-wrapper">
                            <input type="text" value="" name="merchant[real_name]" id="realname" data-role="phone" class="text-field" autofocus="autofocus" placeholder="请输入姓名" />
                        </div>
                        <div class="field-wrapper">
                            <input type="text" value="" name="merchant[identity_num]" id="identity_num" data-role="phone" class="text-field" autofocus="autofocus" placeholder="请输入身份证号" />
                        </div>
                        <div class="field-wrapper">
                            <input type="hidden" value="{{$MID}}" name="merchant[MID]"  />
                            <input type="button" value="完成" name="commit" class="submit-field" id="submit-btn" />
                        </div>
                    </div>
				{{Form::close()}}
			</div>
		</div>

	</div>

@stop