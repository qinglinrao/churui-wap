<div class="order">
	<div class="order-top clearfix">
		<div class="order-sn">
			订单号：<a href="{{URL::route('orders.detail',array('id'=>$order->id))}}">{{$order->order_sn}}</a>
		</div>
		<div class="order-status">
			{{get_order_status()[$order->status_id]}}
		</div>
	</div>
	<div class="order-products-list">
	    @foreach($order->products as $product)
		<div class="order-product clearfix">
			<div class="left">
				<div class="prod-img">
					<img src="{{$product->product&&$product->product->image?AppHelper::imgSrc($product->product->image->url):''}}" alt="产品图片" />
				</div>
			</div>
			<div class="center">
				<div class="prod-title">
					<a href="#">{{mb_substr( $product->name, 0, 22, 'utf-8')}}</a>
				</div>
				<div class="prod-attrs">
					<span>
					        {{--order_product_option_sets(--}}
                        {{$product->option_set_values}}
                    </span>
				</div>
			</div>
			<div class="right">
				<div class="prod-sale-price">
					<span>￥{{$product->price}}</span>
				</div>
				<div class="prod-num">
					<span>x{{$product->quantity}}</span>
				</div>
			</div>
		</div>
		@endforeach

	</div>
	<div class="order-bottom clearfix">
		<ul class="list-unstyled list-inline">
			<li class="total-num">共计<span>{{get_order_product_num($order)}}</span>件商品</li>
			{{--<li class="express-price">运费<span>￥68.00</span></li>--}}
			<li class="total-price">实付<span>￥{{$order->total}}</span></li>
		</ul>
	</div>
	<div class="order-actions clearfix">
		<div class="order-actions-inner">
		    {{$list?get_order_deal_operate($order):get_order_detail_operate($order)}}
		</div>
	</div>
</div>