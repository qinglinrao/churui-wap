@extends('public/html')

@section('wrapper')
	<div id="main-wrapper">
	    <p class="form-tip">{{$errors->first()}}</p>
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">商家登录</h1>
			</div>
		</div>
		<div id="main-content">
			<div class="user-login has-padding">
			    {{Form::open(array('url'=>URL::route('merchants_login'),'id'=>'customer-login','class'=>'new_customer'))}}
			        <div class="field-wrapper">
                        <div class="label">
                            <span class="login-tip" id="login-tip"></span>
                        </div>
                    </div>
					<div class="fields-group">
						<div class="field-wrapper">
							{{Form::text('mobile','',array('id'=>'customer_login','class'=>'text-field phone-field','placeholder'=>'请输入手机号码'))}}
						</div>
						<div class="field-wrapper">
						    {{Form::password('password',array('id'=>'customer_password','class'=>'text-field password-field','placeholder'=>'请输入密码','autocomplete'=>'off'))}}
						</div>
					</div>
					<div class="field-wrapper clearfix">
						<a href="{{URL::route('merchants_forget_password')}}" class="forget-password"><span>忘记密码?</span></a>
					</div>
					<div class="field-wrapper">
					    {{Form::submit('登录',array('class'=>'submit-field','id'=>'login-submit-btn'))}}
					</div>
					{{--<div class="field-wrapper">--}}
						{{--<div class="register-link">--}}
							{{--<a href="{{URL::route('merchants_register')}}">还没有账号？立即注册</a>--}}
							{{--<a href="#"><span></span></a>--}}
						{{--</div>--}}
					{{--</div>--}}
				{{Form::close()}}
				{{--<div class="social-login">--}}
					{{--<div class="title-wrapper">--}}
						{{--<span class="title">第三方账号登录</span>--}}
					{{--</div>--}}
					{{--<ul>--}}
						{{--<li><a href="#" class="icon-wrapper"><span class="icon qq"></span></a></li>--}}
						{{--<li><a href="#" class="icon-wrapper"><span class="icon weixin"></span></a></li>--}}
						{{--<li><a href="#" class="icon-wrapper"><span class="icon sina"></span></a></li>--}}
					{{--</ul>--}}
				{{--</div>--}}
			</div>
		</div>
	</div>
@stop