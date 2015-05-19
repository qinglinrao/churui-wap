@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">{{$category->name}}</h1>
			</div>
			<div class="right">
				<a href="{{AppHelper::UrlRoute(false,'products.categories')}}" class="categories icon-menu">categories</a>
			</div>
		</div>
		<div id="main-content">
			{{--<div class="top-menu clearfix">--}}
				{{--<div class="iscroll-wrapper">--}}
					{{--<div class="scroll-content">--}}
						{{--<ul class="list-unstyled">--}}
							{{--<li><a href="{{AppHelper::UrlRoute(false,'home')}}">首页</a></li>--}}
							{{--@foreach($categories as $cat)--}}
								{{--<li><a href="{{AppHelper::UrlRoute(false,'products',['catId'=>$cat->id])}}" class="{{$cat->id == $activeId ? 'active' : ''}}">{{$cat->name}}</a></li>--}}
							{{--@endforeach--}}
						{{--</ul>--}}
					{{--</div>--}}
				{{--</div>--}}
			{{--</div>--}}

			{{--@include('public.slideshow')--}}

			<div class="filter-bar-wrapper clearfix">
				<ul class="filters">
					<li class="{{Input::get('orderBy') == 'created_at'?'active':''}}">
						<a href="{{AppHelper::UrlRoute(false,'products',['catId'=>Input::get('catId'),'orderBy'=>'created_at','sort'=>Input::get('sort') == 'asc' ? 'desc' : 'asc'])}}">
							最新 @if(Input::get('orderBy') == 'created_at'){{Input::get('sort') == 'asc' ? '↓' : '↑'}}@endif
						</a>
					</li>
					<li class="{{Input::get('orderBy') == 'sale_price'?'active':''}}">
						<a href="{{AppHelper::UrlRoute(false,'products',['catId'=>Input::get('catId'),'orderBy'=>'sale_price','sort'=>Input::get('sort') == 'asc' ? 'desc' : 'asc'])}}">
							价格 @if(Input::get('orderBy') == 'sale_price'){{Input::get('sort') == 'asc' ? '↓' : '↑'}}@endif
						</a>
					</li>
					<li class="{{Input::get('orderBy') == 'sale_count'?'active':''}}">
						<a href="{{AppHelper::UrlRoute(false,'products',['catId'=>Input::get('catId'),'orderBy'=>'sale_count','sort'=>Input::get('sort') == 'asc' ? 'desc' : 'asc'])}}">
							销量 @if(Input::get('orderBy') == 'sale_count'){{Input::get('sort') == 'asc' ? '↓' : '↑'}}@endif
						</a>
					</li>
				</ul>
				{{--<ul class="theme-switcher">--}}
					{{--<li><span data-type="two-col" class="two-col active"></span></li>--}}
					{{--<li><span data-type="one-col" class="one-col"></span></li>--}}
					{{--<li><span data-type="image" class="image"></span></li>--}}
				{{--</ul>--}}
			</div>
			<div class="products-list clearfix one-col" data-role="data-wrapper">
				@include('products._product')
			</div>
			<div class="load-more-link">
				{{$products->links()}}
			</div>
		</div>
	</div>
@stop