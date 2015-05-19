@extends('public.html')


@section('scripts')
<script>
    $(function(){
        var shareData = {
            title: '{{$product->name}}',
            desc: '{{$product->name}}',
            link: location.href,
            imgUrl: '{{$product->images&&$product->images->first()?AppHelper::imgSrc($product->images->first()->url):location.origin+'/assets/images/tu02.jpg'}}'
        };

        var ticket = '{{AppHelper::getWechatSignature()}}';
        $.wechatShare(shareData,ticket);
    })
</script>
@stop

@section('wrapper')
	<div id="main-wrapper" class="with-footer">
        <p class="form-tip">{{$errors->first()}}</p>
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">商品详情</h1>
			</div>
			<div class="right">
			    @if($deleted)
                <a onclick="return confirm('您确定要将此商品移出您的店铺?')" href="{{URL::route('merchants.shop.delete_product',array('SPID'=>Input::get('SPID')))}}" class="icon-deleted">links</a>
				@else
                <a href="#" class="links-toggle-button icon-menu">links</a>
				<div class="dropdown-menu-wrapper">
					<div class="up-arrow"></div>
					<ul class="dropdown-menu">
						{{--<li class="share"><a href="#">分享</a></li>--}}

						<li class="home"><a href="{{get_home_link()}}">首页</a></li>

					</ul>
				</div>

				@endif
			</div>
		</div>

		<div id="main-content" class="products-detail-base">

			@include('public.slideshow',['images'=>$product->images])

			<div class="product-base-info">
				<div class="top clearfix">
					<div class="prod-name">
					    <b></b>
						<em>{{$product->name}}</em>
					</div>
					<div class="collect-button {{$collected ? 'collected' : ''}}" data-pid="{{$product->id}}">
						<span class="collect-icon"></span>
						<span class="collect-text"><span class="collected">已</span>收藏</span>
					</div>
				</div>
				<div class="middle">
					<div class="sale-price-wrapper clearfix">
						<div class="prod-sale-price">
							<span>￥{{AppHelper::price($product->sale_price)}}</span>
						</div>
						{{--<div class="activity">--}}
							{{--<span>活动类型</span>--}}
						{{--</div>--}}
					</div>
					<div class="par-price-wrapper clearfix">
						<div class="prod-par-price">
							<span>￥{{AppHelper::price($product->par_price)}}</span>
						</div>
						<div class="prod-sale-count">
							<span>已售{{$product->sale_count}}件</span>
						</div>
					</div>
					{{--<div class="express-price">--}}
						{{--<span>快递：￥10.00</span>--}}
					{{--</div>--}}
				</div>
				{{--<div class="bottom">--}}
					{{--<div class="label">--}}
						{{--服务条款--}}
					{{--</div>--}}
					{{--<ul class="services-list clearfix">--}}
						{{--@foreach($product->services as $service)--}}
						{{--<li><span>{{$service->name}}</span></li>--}}
						{{--@endforeach--}}
					{{--</ul>--}}
				{{--</div>--}}
				<div class="select-attributes">
					<span>选择：{{$optionNames}}</span>
				</div>
				<div class="more-detail">
					<a href="{{URL::route('products.more',array('id'=>$product->id,'SPID'=>Input::get('SPID'),'MID'=>Input::get('MID')))}}">查看参数及图文详情</a>
				</div>
			</div>
			<div class="product-comments clearfix">
				<div class="comments-info clearfix">
					<div class="comments-count">
						商品评价（{{$commentsCount}}）
					</div>
					<div class="comments-avg-start">
						<ul class="five-star">
							@for($i = 1; $i <=5; $i++)
								<li class="{{($i <= $avgStar ? 'active ': '').$i}}"></li>
							@endfor
						</ul>
					</div>
				</div>
				@if($product->latestComment->count() > 0)
				<div class="comment clearfix">
					<div class="comment-user clearfix">
						<div class="user-pic">
							<img src="{{$product->latestComment[0]->user->detail->image ? AppHelper::imgSrc($product->latestComment[0]->user->detail->image->url) : '/assets/images/default_head.jpg'}}" />
						</div>
						<div class="user-name">
							{{AppHelper::cutStr($product->latestComment[0]->author)}}
						</div>
					</div>
					<div class="comment-detail">
						<span>{{$product->latestComment[0]->detail}}</span>
					</div>
					<div class="comment-time"></div>
					<div class="comment-prod-attr">
					    @if($product->latestComment[0]->entity)
						{{$product->latestComment[0]->entity->option_set_values}}
						@endif
					</div>
				</div>
				@endif
				<div class="comments-view-more">
					<a href="{{URL::route('products.comments',$product->id)}}">查看更多评价</a>
				</div>
			</div>
		</div>

		@include('products._attributes')

		<div id="footer">
			<table class="add-to-cart">
				<tbody>
				<tr>
					<td class="shopping-cart-wrapper">
						<a href="{{URL::route('cart')}}" class="shopping-cart-base">
							<span class="cart-prod-num"><span>0</span></span>
						</a>
					</td>
					<td><span class="buy-button"><span>立即购买</span></span></td>
					<td><span class="add-to-cart-button"><span>加入购物车</span></span></td>
					<td class="confirm"><span class="submit-button"><span>确定</span></span></td>
				</tr>
				</tbody>
			</table>
		</div>

	</div>
@stop