@extends('public.html')

@section('wrapper')
	<div id="main-wrapper" class="with-footer">
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">商品详情</h1>
			</div>
			<div class="right">
				<a href="#" class="links-toggle-button icon-menu">links</a>
				<div class="dropdown-menu-wrapper">
					<div class="up-arrow"></div>
					<ul class="dropdown-menu">
						{{--<li class="share"><a href="#">分享</a></li>--}}
						<li class="home"><a href="/">首页</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="main-content" class="products-detail-more">
			{{--<div class="top-menu two-col clearfix">--}}
				{{--<ul>--}}
					{{--<li><a href="#" class="active">产品参数</a></li>--}}
					{{--<li><a href="#">图文详情</a></li>--}}
				{{--</ul>--}}
			{{--</div>--}}
			{{--<div class="product-param-wrapper margin-top">--}}
				{{--<ul>--}}
					{{--@foreach($product->attributeValues as $value)--}}
					{{--<li class="clearfix">--}}
						{{--<div class="param-name">--}}
							{{--{{$value->attribute->name}}：--}}
						{{--</div>--}}
						{{--<div class="param-value">--}}
							{{--{{$value->value}}--}}
						{{--</div>--}}
					{{--</li>--}}
					{{--@endforeach--}}
				{{--</ul>--}}
			{{--</div>--}}
			<div class="product-detail margin-top">
				{{$product->detail}}
			</div>
		</div>

		@include('products._attributes')

		<div id="footer">
			<table class="add-to-cart">
				<tbody>
				<tr>
					<td class="shopping-cart-wrapper"><a href="{{URL::route('cart')}}" class="shopping-cart-base"><span class="cart-prod-num"><span>2</span></span></a></td>
					<td><a href="#" class="buy-button"><span>立即购买</span></a></td>
					<td><a href="#" class="add-to-cart-button"><span>加入购物车</span></a></td>
					<td class="confirm"><a href="#" class="submit-button"><span>确定</span></a></td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
@stop