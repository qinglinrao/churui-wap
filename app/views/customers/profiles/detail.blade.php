@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">

		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">个人资料</h1>
			</div>
		</div>

		<div id="main-content">
			<div class="profile-detail">
				<div class="user-detail-wrapper">
				    <p class="upload-picture-tip">{{$errors->first()}}</p>
					<ul class="user-detail list-unstyled part-1">
						<li class="picture clearfix">
							<span class="label">头像</span>
							<div class="picture">
							    @if($customer->detail->image)
                                <img src="{{AppHelper::imgSrc($customer->detail->image->url)}}" />
								@else
                                <img src="/assets/images/prod_thumb.png" />
								@endif
								{{Form::open(array('url'=>URL::route('customers.profile.image.upload'),'files'=>'true'))}}
								    {{Form::file('picture',array('accept'=>'.png,.gif,..jpg','class'=>'picture-field','id'=>'profile-image'))}}
								{{Form::close()}}
							</div>
						</li>
						<li class="user-name">
							<span class="label">昵称</span>
							<a href="{{URL::route('customers.profile.username')}}" class="change-user-name value">{{$customer->detail->username}}</a>
						</li>
						{{--<li class="level">--}}
							{{--<span class="label">等级</span>--}}
							{{--<a href="{{URL::route('customers.profile.level')}}" class="level value">LV{{$customer->level_id}}</a>--}}
						{{--</li>--}}
					</ul>
					<ul class="user-detail list-unstyled part-2">
						<li class="password">
							<span class="label">修改密码</span>
							<a href="{{URL::route('customers.profile.password')}}" class="change-password value">
								<span>更改</span>
							</a>
						</li>
						<li class="phone">
							<span class="label">已绑定手机</span>
							<a href="{{URL::route('customers.profile.phone')}}" class="value">
								{{$customer->mobile}}<span>更改</span>
							</a>
						</li>
					</ul>

					<div class="logout">
					    <a href="{{URL::route('customers.logout')}}" onclick="return confirm('您确定要退出系统?')" class="submit-field">退出系统</a>
					</div>
				</div>
			</div>
		</div>

	</div>
@stop