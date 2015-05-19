@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">{{$brand->name}}</h1>
			</div>
			<div class="right">
				<a href="{{URL::route('products.categories')}}" class="categories icon-menu">categories</a>
			</div>
		</div>
		<div id="main-content">
			<div class="top-menu clearfix">
				<ul class="list-unstyled">
					<li><a href="{{URL::route('home')}}">首页</a></li>
					@foreach($categories as $cat)
					<li><a href="{{URL::route('products',['catId'=>$cat->id])}}" class="{{$cat->id == $activeId ? 'active' : ''}}">{{$cat->name}}</a></li>
					@endforeach
				</ul>
			</div>

			@include('public.slideshow')

			<div class="filter-bar-wrapper clearfix">
				<ul class="filters">
					<li><a href="#">最新</a></li>
					<li><a href="#">价格</a></li>
					<li><a href="#">销量</a></li>
				</ul>
				<ul class="theme-switcher">
					<li><span data-type="two-col" class="two-col active"></span></li>
					<li><span data-type="one-col" class="one-col"></span></li>
					<li><span data-type="image" class="image"></span></li>
				</ul>
			</div>
			<div class="products-list clearfix two-col" data-role="data-wrapper">
				@include('products._product')
			</div>
			<div class="load-more-link">
				{{$products->links()}}
			</div>
		</div>
	</div>
@stop