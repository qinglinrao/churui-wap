@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">订单详情</h1>
			</div>
		</div>
		<div id="main-content">
			<div class="order-detail">
				<div class="order-base-info">
					<div class="order-status">
						{{get_order_status()[$order->status_id]}}
					</div>
					<div class="order-total-price">
						订单金额(含运费)：￥{{$order->total}}
					</div>
					<div class="express-price">
						运费:￥8.00
					</div>
				</div>
				<div class="order-more-wrapper">
					<div class="receiver-info">
						<div class="receiver-name">
							收货人:{{$order->address?$order->address->name:''}}
							<div class="receiver-phone">
								{{$order->address?$order->address->mobile:''}}
							</div>
						</div>
						<div class="receiver-address">
							{{$order->address?$order->address->alias:''}}
						</div>
					</div>
					<div class="order-detail-info">
						<ul class="order-date">
							<li>下单时间：{{$order->created_at}}</li>
							<li>配送方式：顺丰快递</li>
						</ul>
						<ul class="order-invoice">
							<li>发票抬头：广州市商侣信息科技有限公司</li>
							<li>发票信息：增值税普通发票</li>
						</ul>
					</div>
					<div class="toggle-button">
						<span>交易详情</span>
					</div>
				</div>

				@include('customers/orders/_order',array('order'=>$order,'list'=>false))

				<div class="order-other-info">
					<div class="order-message">
						<div class="label">
							<span>买家留言</span>
						</div>
						<div class="message-detail">
							<span>{{$order->note}}</span>
						</div>
					</div>
					<div class="order-logistics">
						<div class="label">
							<span>物流跟踪</span>
						</div>
					</div>
					<div class="logistics-detail">
						<ul class="list-unstyled">
							<li><span>广州市商侣信息科技有限公司广州市商侣信息科技有限公司</span><br /><span>2014-06-06 09:58</span></li>
							<li><span>广州市商侣信息科技有限公司广州市商侣信息科技有限公司</span><br /><span>2014-06-06 09:58</span></li>
							<li><span>广州市商侣信息科技有限公司广州市商侣信息科技有限公司</span><br /><span>2014-06-06 09:58</span></li>
							<li><span>广州市商侣信息科技有限公司广州市商侣信息科技有限公司</span><br /><span>2014-06-06 09:58</span></li>
							<li><span>广州市商侣信息科技有限公司广州市商侣信息科技有限公司</span><br /><span>2014-06-06 09:58</span></li>
							<li><span>广州市商侣信息科技有限公司广州市商侣信息科技有限公司</span><br /><span>2014-06-06 09:58</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
@stop