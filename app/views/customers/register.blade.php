@extends('public.html')

@section('wrapper')

	<div id="main-wrapper">

		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">注册</h1>
			</div>
		</div>

		<div id="main-content">
			<div class="user-register has-padding">
			    {{Form::open(array('url'=>URL::route('customers.register'),'class'=>'new_customer','id'=>'new_customer'))}}
				{{--<form method="post" id="new_customer" class="new_customer" action="/users/register" accept-charset="UTF-8">--}}
					<div style="display:none">
						<input type="hidden" value="✓" name="utf8" />
						<input type="hidden" value="BDLNXuGmzeZdvrBp4eQL2pDveaqIjkWDXNwbGdyJnXU=" name="authenticity_token" />
					</div>
					<div id="step-1">
						<div class="field-wrapper">
							<div class="label">
								<span>请确认您所在的国家及地区</span>
							</div>
							<input type="text" value="中国" disabled="disabled" class="text-field" />
						</div>
						<div class="field-wrapper">
							<div class="label">
								<span>此手机号用来接收验证码，请仔细填写</span>
							</div>
							<input type="text" value="" name="customer[phone]" id="customer_phone" data-role="phone" class="text-field" autofocus="autofocus" />
						</div>
						<div class="field-wrapper">
							<a id="next-step" class="submit-field next-register-step"><span>下一步</span></a>
						</div>
						<div class="field-wrapper term-field clearfix">
							<div class="icheckbox checked" style="position: relative;">
								<input type="checkbox" value="1" name="term" id="termcheck" checked="checked" style="position: absolute; opacity: 0;" />
								<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: none repeat scroll 0% 0% rgb(255, 255, 255); border: 0px none; opacity: 0;"></ins>
							</div>
							<span class="term">注册即表示已阅读并同意<a href="#"><span>用户注册协议</span></a></span>
						</div>
					</div>
					<div id="step-2" class="hide">
						<div class="field-wrapper clearfix">
							{{--<div class="label">--}}
								{{--<span id="auth-code-tip">请输入您接收到的验证码</span>--}}
							{{--</div>--}}
							<input type="text" placeholder="请输入验证码" name="authcode" id="authcode" class="auth-code-field text-field" />
							<a class="get-code-button" id="get-register-code">获取验证码</a>
						</div>
						<div class="field-wrapper">
							<input type="password" placeholder="设置密码" name="password" id="customer_password" class="text-field" autocomplete="off" />
							<span href="#" data-target="#customer_password" class="toggle-password-text"><span>toggle</span></span>
						</div>
						<div class="field-wrapper">
						    <input type="hidden" name="merchant_id" value="{{$MID}}" id="merchant_id"/>
							<input type="submit" value="完成" name="commit" class="submit-field" id="submit-btn" />
						</div>
					</div>
				{{--</form>--}}
				{{Form::close()}}
			</div>
		</div>

	</div>

@stop