@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">

		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">我的订单</h1>
			</div>
			<div class="right">
                <a class="icon-home" href="{{URL::route('home')}}">首页</a>
            </div>
		</div>

		<div id="main-content">
			<div class="top-menu clearfix">
				<ul class="list-unstyled">
					<li><a href="{{URL::route('orders')}}" class="all {{$status==''?'active':''}}">全部</a></li>
					<li><a href="{{URL::route('orders',array('status'=>1))}}" class="waiting-pay {{$status==1?'active':''}} ">待支付</a></li>
					<li><a test="title" href="{{URL::route('orders',array('status'=>3))}}" data-test="test" class="waiting-deliver {{$status==3?'active':''}}">待收货</a></li>
					<li><a test="title" href="{{URL::route('orders',array('status'=>4))}}"  data-test="test" class="waiting-comment {{$status==4?'active':''}}">待评论</a></li>
					<li><a href="{{URL::route('orders',array('status'=>7))}}" class="after-sales {{$status==6||$status==7?'active':''}}">退款/售后</a></li>
				</ul>
			</div>

			<div class="orders-list margin-top">
				@foreach($orders as $order)
                    @include('customers/orders/_order',array('order'=>$order,'list'=>true))
                @endforeach
			</div>
		</div>
	</div>
@stop