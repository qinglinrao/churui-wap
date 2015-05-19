@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
	    <p class="form-tip">{{$errors->first()}}</p>
		<div id="header" class="clearfix">
			<div class="left">
				<a href="javascript:history.back(-1)" class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">更改绑定手机号</h1>
			</div>
		</div>
		<div id="main-content">
			<div class="change-phone">
				<p class="current-phone">当前绑定手机号：{{$merchant->mobile}}</p>
				{{Form::open(array('url'=>URL::route('merchants.info.update_mobile'),'id'=>'profile-phone'))}}

					<div class="field-wrapper clearfix">
					    {{Form::text('mobile','',array(' data-role'=>'phone','class'=>'text-field phone-field','placeholder'=>'请输入手机号码','autocomplete'=>'off'))}}
						<a class="get-code-button" id="get-phone-code">获取验证码</a>
					</div>
					<div class="field-wrapper">
					    {{Form::text('authcode','',array('class'=>'text-field code-field','placeholder'=>'验证码','autocomplete'=>'off'))}}
					</div>
					<div class="field-wrapper">
					    {{Form::submit('提交',array('class'=>'submit-field'))}}
					</div>
				{{Form::close()}}
			</div>
		</div>
	</div>
@sto