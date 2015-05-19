@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">分类</h1>
			</div>
			<div class="right">
				<a href="{{AppHelper::UrlRoute(false,'merchants.shop.product_category')}}" class="categories icon-menu">categories</a>
			</div>
		</div>

		<div id="main-content">
			<div class="product-categories">
				<div class="left">
					<ul>
						@foreach($categories as $k => $cat)
						<li class="{{($cat->id == $id || (!$id && $k == 0)) ? 'active' : ''}}">
							<a href="{{AppHelper::UrlRoute(false,'merchants.shop.product_category',$cat->id)}}">{{$cat->name}}</a>
						</li>
						@endforeach
					</ul>
				</div>
				<div class="right">
					<div class="categories-list clearfix list-wrapper">
                        {{--<h3 class="section-title">分类</h3>--}}
                        <ul class="clearfix">
                            @foreach($subCategories as $subCat)
                            <li>
                                <a href="{{AppHelper::UrlRoute(false,'merchants.shop.category_product',['catId'=>$subCat->id])}}">
                                    <img src="{{$subCat->image?AppHelper::imgSrc($subCat->image->url):'/assets/images/prod_thumb.png'}}"/>
                                    <span>{{$subCat->name}}</span>
                                </a>
                            </li>
                            @endforeach
                        </ul>
                    </div>
					{{--<div class="brands-list clearfix list-wrapper">--}}
						{{--<h3 class="section-title">品牌</h3>--}}
						{{--<ul class="clearfix">--}}
							{{--@foreach($brands as $b)--}}
								{{--<li>--}}
									{{--<a href="{{AppHelper::UrlRoute(false,'products',['brandId'=>$b->id])}}">--}}
										{{--<img src="{{$b->image->url}}"/>--}}
									{{--</a>--}}
								{{--</li>--}}
							{{--@endforeach--}}
						{{--</ul>--}}
					{{--</div>--}}
				</div>
			</div>
		</div>
	</div>
@stop