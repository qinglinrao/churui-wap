@extends('public.html')

@section('wrapper')

	<div id="main-wrapper">

		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">个人中心</h1>
			</div>
			<div class="right">
				<a class="icon-home" href="{{URL::route('home')}}">首页</a>
			</div>
		</div>

		<div id="main-content">
			<div class="profile-index">
				<div class="user-info-wrapper">

					@if($auth_checked)
					<div class="user-icon">
                        <a href="{{URL::route('customers.profile.detail')}}"><img src="{{$customer->detail &&$customer->detail->image?AppHelper::imgSrc($customer->detail->image->url):'/assets/images/prod_thumb.png'}}" alt="#"></a>
                    </div>
					<div class="user-info-detail">
                        <span>{{$customer->detail->username}}
                        {{--&nbsp;&nbsp;等级LV{{$customer->level_id}}--}}
                        </span>

                    </div>
					@else
					<div class="user-icon">
                        <img src="/assets/images/prod_thumb.png" alt="#">
                    </div>
					<div class="login-button">
                        <a href="{{URL::route('customers.login')}}">
                            <span>立即登录</span>
                        </a>
                    </div>
                    @endif
				</div>
				<div class="top-menu clearfix">
					<ul class="list-unstyled">
						<li>
							<a href="{{URL::route('orders',array('status'=>1))}}" class="waiting-pay">
								<span class="text">待支付</span>
								@if($auth_checked && $waiting_pay > 0)
                                    <div class="num"><span>{{$waiting_pay}}</span></div>
                                @endif
							</a>
						</li>
						<li>
							<a test="title" href="{{URL::route('orders',array('status'=>3))}}" data-test="test" class="waiting-receive">
								<span class="text">待收货</span>
								@if($auth_checked && $waiting_receive > 0)
                                    <div class="num"><span>{{$waiting_receive}}</span></div>
                                @endif
							</a>
						</li>
						<li>
							<a href="{{URL::route('orders',array('status'=>7))}}" class="after-sales">
								<span class="text">退款/售后</span>
								@if($auth_checked && $after_sales > 0)
                                    <div class="num"><span>{{$after_sales}}</span></div>
                                @endif
							</a>
						</li>
					</ul>
				</div>
				<div class="sub-menu margin-top">
					<ul class="list-unstyled">
						<li>
							<a href="{{URL::route('orders')}}" class="my-orders">
								<span>我的订单</span>
							</a>
						</li>
						<li>
							<a href="{{action('FavoriteController@getIndex')}}" class="my-collects">
								<span>我的收藏</span>
							</a>
						</li>
						<li>
							<a href="{{URL::route('cart')}}" class="shopping-cart">
								<span>购物车</span>
							</a>
						</li>
                        <li>
                            <a href="{{URL::route('cart')}}" class="shopping-cart">
                                <span>我的会员</span>
                            </a>
                        </li>
                        <li>
                            <a href="{{URL::route('agent.index')}}" class="shopping-cart">
                                <span>代理提成</span>
                            </a>
                        </li>
					</ul>
				</div>
				<div class="sub-menu">
					<ul class="list-unstyled">
						<li>
							<a href="{{URL::route('addresses')}}" class="address">
								<span>收货地址</span>
							</a>
						</li>
						{{--<li>--}}
							{{--<a class="message">--}}
								{{--<span>消息</span>--}}
							{{--</a>--}}
						{{--</li>--}}
						{{--<li>--}}
							{{--<a class="coupon">--}}
								{{--<span>优惠券/礼品卡</span>--}}
							{{--</a>--}}
						{{--</li>--}}
					</ul>
				</div>
				<div class="sub-menu">
					<ul class="list-unstyled">

						{{--<li>--}}
							{{--<a href="{{URL::route('about')}}" class="about-us">--}}
								{{--<span>关于我们</span>--}}
							{{--</a>--}}
						{{--</li>--}}
						<li>
                            <a href="{{URL::route('comments')}}" class="about-us">
                                <span>我的评价</span>
                            </a>
                        </li>
						<li>
                            <a href="{{URL::route('sale_service')}}" class="after-sales">
                                <span>售后服务</span>
                            </a>
                        </li>
					</ul>
				</div>
			</div>
		</div>

	</div>
@stop