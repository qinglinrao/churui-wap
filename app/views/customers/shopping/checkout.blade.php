@extends('public.html')

@section('wrapper')

	<div id="main-wrapper" class="with-footer">

		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">确认订单</h1>
			</div>
		</div>

		<div id="main-content">
			{{Form::open(['url'=>URL::route('orders'),'id'=>'confirm-order-form'])}}
				{{Form::hidden('address',$defaultAddress->id,['class'=>'address-field'])}}
				<div class="checkout">
					<div class="order-address block-wrapper">
						<div class="label">
							<span>收货信息</span>
						</div>
						<div id="address-detail-wrapper">
							<div class="address-detail">
								<span>{{$defaultAddress->alias.$defaultAddress->address}}</span>
							</div>
							<div class="receiver-info clearfix">
								<ul>
									<li><span>{{$defaultAddress->name}}</span></li>
									<li><span>{{$defaultAddress->mobile}}</span></li>
									<li><span>510000</span></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="payment-method block-wrapper">
						<div class="top">
							{{--<div class="other-payment">--}}
								{{--<a href="#"><span>其他支付方式</span></a>--}}
							{{--</div>--}}
							<div class="label">
								<span>支付方式</span>
							</div>
						</div>
						<table>
							<tbody>
							<tr>
								<td>
									{{Form::radio('payment','ALIPAY',1)}}
								</td>
								<td><img src="/assets/images/alipay_icon.png" /><span>支付宝</span></td>
							</tr>
							<tr>
                                <td>
                                    {{Form::radio('payment','WXPAY')}}
                                </td>
                                <td><img src="/assets/images/wxpay_icon.png" /><span>微信支付</span></td>
                            </tr>


							{{--<tr>--}}
								{{--<td>--}}
										{{--<input type="radio" value="BANK" name="payment" />--}}
								{{--</td>--}}
								{{--<td><img src="/assets/images/bank_icon.png" /><span>银行卡支付</span></td>--}}
							{{--</tr>--}}
							</tbody>
						</table>
					</div>
					<div class="order-price-detail block-wrapper">
						<div class="label">
							<span>费用详情</span>
						</div>
						<table>
							<tbody>
							<tr>
								<td class="align-left">商品总金额</td>
								<td class="align-right">￥{{AppHelper::price($totalPrice)}}</td>
							</tr>
							{{--<tr>--}}
								{{--<td class="align-left">运费</td>--}}
								{{--<td class="align-right">￥2.00</td>--}}
							{{--</tr>--}}
							</tbody>
						</table>
					</div>
					<div class="invoice-wrapper block-wrapper">
						<div class="label">
							{{Form::checkbox('invoice',1,0,['class'=>'invoice-field'])}}
							<span>开具发票</span>
						</div>
						<div class="invoice-detail">
							<table>
								<tbody>
								<tr>
									<td>
										{{Form::radio('invoice-type','personal',1)}}
										<span>个人</span>
									</td>
									<td>
										{{Form::radio('invoice-type','company')}}
										<span>公司</span>
									</td>
								</tr>
								</tbody>
							</table>
							<div class="label">
								<span>发票抬头</span>
							</div>
							<div class="textarea-wrapper">
								{{Form::textarea('invoice-head','',['rows'=>2,'placeholder'=>'请输入发票抬头'])}}
							</div>
						</div>
					</div>
					<div class="message-wrapper block-wrapper">
						<div class="label">
							<span>给商家留言</span>
						</div>
						<div class="textarea-wrapper">
							{{Form::textarea('message','',['rows'=>2,'placeholder'=>'请输入留言内容'])}}
						</div>
					</div>
				</div>
			{{Form::hidden('entityIds',$entityIds)}}
			{{Form::hidden('type',$type)}}
			{{Form::hidden('quantity',$quantity)}}
			{{Form::hidden('shopId',$shopId)}}
			{{Form::close()}}
		</div>

		<div id="footer">
			<table>
				<tbody>
				<tr>
					<td>
						<div class="total-price">
							总计：
							<span class="price">￥{{AppHelper::price($totalPrice)}}</span>
						</div></td>
					<td>
						<div id="submit-order" class="submit-button brown-bg">
							<span>结算</span>
						</div></td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div id="addresses-list-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<span id="move-back" class="go-back">返回</span>
			</div>
			<div class="center">
				<h1 id="page-title">选择地址</h1>
			</div>
		</div>
		<div id="main-content">
			<div class="addresses-list checkout">
				@foreach($addresses as $address)
				<div data-addid="{{$address->id}}" class="order-address block-wrapper">
					<div class="address-detail-wrapper">
						<div class="address-detail">
							<span>{{$address->alias.$address->address}}</span>
						</div>
						<div class="receiver-info clearfix">
							<ul>
								<li><span>{{$address->name}}</span></li>
								<li><span>{{$address->mobile}}</span></li>
								<li><span>510000</span></li>
							</ul>
						</div>
					</div>
				</div>
				@endforeach
			</div>
		</div>
	</div>

	<div id="payment-methods-list-wrapper"></div>

@stop