@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">

			<div class="center">
				{{Form::open(['url'=>URL::route('products.search'),'method'=>'get','id'=>'search-form'])}}
					{{Form::text('keyword',$keyword,['class'=>'keyword-field','placeholder'=>'输入商品名称或分类名称'])}}
					{{Form::submit('',['class'=>'submit'])}}
				{{Form::close()}}
			</div>
			<span class="cancel-search">取消</span>
		</div>
		<div id="main-content">
			<div class="filter-bar-wrapper clearfix">
				<ul class="filters">
					<li>
						<a href="{{URL::route('products.search',['keyword'=>$keyword,'catId'=>Input::get('catId'),'orderBy'=>'created_at','sort'=>Input::get('sort') == 'asc' ? 'desc' : 'asc'])}}">
							最新 @if(Input::get('orderBy') == 'created_at'){{Input::get('sort') == 'asc' ? '↓' : '↑'}}@endif
						</a>
					</li>
					<li>
						<a href="{{URL::route('products.search',['keyword'=>$keyword,'catId'=>Input::get('catId'),'orderBy'=>'sale_price','sort'=>Input::get('sort') == 'asc' ? 'desc' : 'asc'])}}">
							价格 @if(Input::get('orderBy') == 'sale_price'){{Input::get('sort') == 'asc' ? '↓' : '↑'}}@endif
						</a>
					</li>
					<li>
						<a href="{{URL::route('products.search',['keyword'=>$keyword,'catId'=>Input::get('catId'),'orderBy'=>'sale_count','sort'=>Input::get('sort') == 'asc' ? 'desc' : 'asc'])}}">
							销量 @if(Input::get('orderBy') == 'sale_count'){{Input::get('sort') == 'asc' ? '↓' : '↑'}}@endif
						</a>
					</li>
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