@extends('public.html')

@section('wrapper')
	<div id="main-wrapper" class="with-footer">
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">购物车</h1>
			</div>
		</div>
		<div id="main-content">
			<div class="shopping-cart">
				<div class="products-list">
					@foreach($cartItems as $item)
						<div class="product clearfix" data-itemid="{{$item->id}}">
							<div class="left">
								<div class="prod-img">
								    @if($item->product && $item->product->image)
									{{AppHelper::img($item->product->image->url)}}
									@endif
								</div>
							</div>
							<div class="center">
								<div class="prod-title">
									<a href="#">{{$item->product->name}}</a>
								</div>
								<div class="prod-attribute">
									<span>颜色：灰色 尺码：L</span>
								</div>
							</div>
							<div class="right">
								<div class="prod-sale-price">
									<span>￥{{AppHelper::price($item->entity->sale_price)}}</span>
								</div>
								<div class="prod-par-price">
									<span>￥199.99</span>
								</div>
								<span data-itemid="{{$item->id}}" class="delete-collect">delete</span>
							</div>
							<div class="bottom clearfix">
								<span class="label">选择数量：</span>
								<div class="buy-count-form">
									<input type="text" class="buy-count" data-stock="{{$item->entity->stock}}" data-itemid="{{$item->id}}" data-price="{{$item->entity->sale_price}}" value="{{$item->quantity}}" name="num" />
									<span class="sub">-</span>
									<span class="plus">+</span>
								</div>
							</div>
						</div>
					@endforeach
				</div>
			</div>
		</div>
		<div id="footer">
			<table>
				<tbody>
				<tr>
					<td>
						<div class="total-price">
							总计：
							<span class="price">￥{{AppHelper::price($totalPrice)}}</span>
							<br />
							<span class="statement">不含运费</span>
						</div></td>
					<td>
						<div id="submit-cart" class="submit-button brown-bg">
							<a href="{{URL::route('checkout')}}"><span>结算</span></a>
						</div></td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
@stop

@section('scripts')
	@parent
	{{HTML::script('/assets/js/shopping_cart.js')}}
@stop