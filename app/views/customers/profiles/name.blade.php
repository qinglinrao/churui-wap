@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">昵称</h1>
			</div>
		</div>
		<div id="main-content">
			<div class="change-name">
				{{Form::open(array('url'=>URL::route('customers.profile.username.update')))}}
					<div class="field-wrapper">
					    {{Form::text('username',$customer->detail->username,array('class'=>'text-field','placeholder'=>'昵称'))}}
					</div>
					<div class="field-wrapper">
						{{Form::submit('提交',array('class'=>'submit-field'))}}
					</div>
				{{Form::close()}}
			</div>
		</div>
	</div>
@stop