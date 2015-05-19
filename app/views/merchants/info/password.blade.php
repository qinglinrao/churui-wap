@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
	<p class="form-tip">{{$errors->first()}}</p>
		<div id="header" class="clearfix">
			<div class="left">
				<a href="javascript:history.back(-1)" class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">修改密码</h1>
			</div>
		</div>
		<div id="main-content">
			<div class="change-password-form">
				{{Form::open(array('url'=>URL::route('merchants.info.update_password'),'id'=>'profile-password'))}}

					<div class="field-wrapper">
					    {{Form::password('old_password',array('class'=>'password-field','placeholder'=>'请输入原密码'))}}
					    {{Form::password('new_password',array('class'=>'password-field','placeholder'=>'设置新密码'))}}
					    {{Form::password('new_password_confirmation',array('class'=>'password-field','placeholder'=>'请再次入新密码'))}}
					</div>
					<div class="field-wrapper">
						<input type="submit" value="提交" class="submit-field" />
					</div>
				{{Form::close()}}
			</div>
		</div>
	</div>
@stop