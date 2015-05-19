@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">我的收藏</h1>
			</div>
			<div class="right">
                <a class="icon-home" href="{{URL::route('home')}}">首页</a>
            </div>
		</div>
		<div id="main-content">
			<div class="collects">
				<div class="collects-list">
					@foreach($collections as $collection)
						<div class="collects-product clearfix">
							<div class="left">
								<div class="prod-img">
									<img src="{{$collection->product &&$collection->product->image?AppHelper::imgSrc($collection->product->image->url):'/assets/images/prod_thumb.png' }}" alt="xxx" />
								</div>
							</div>
							<div class="center">
								<div class="prod-title">
									<a href="#">{{$collection->product_name}}</a>
								</div>
								<div class="prod-sale-price">
									<span>￥{{AppHelper::price($collection->product->sale_price)}}</span>
								</div>
							</div>
							<div class="right">
								<a href="{{URL::route('favorite.del',array('id'=>$collection->id))}}" class="delete-collect" onclick="return confirm('你确定要删除该收藏吗?')">delete</a>
							</div>
						</div>
					@endforeach
				</div>
			</div>
		</div>
	</div>
@stop