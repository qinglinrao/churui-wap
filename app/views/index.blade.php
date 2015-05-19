@extends('public.template')

@section('wrapper')
<div class="sunn_wrapper">
    <div id="sunn_main">

        <section class="header">
            <div class="search homesearch">
                {{Form::open(array('url'=>'search_product','method'=>'get'))}}
                <input type="submit" class="input-submit">
                <input type="text" name="query" class="input-text" placeholder="请输入商品名称">
                {{Form::close()}}
            </div>
            <a href="#" class="logo"></a>
            <a href="{{URL::route('products.categories')}}" class="monav"></a>
        </section><!-- 头部 -->

        <section class="owlbanner banner">
          <div id="owl-banner" data-rtl="0" data-time="3000" class="owl-carousel">
            @foreach($banners as $banner)
            <div class="item"><a href="{{$banner->url?$banner->url:'#'}}"> <img src="{{$banner->image?AppHelper::imgSrc($banner->image->url):''}}" ></a></div>
            @endforeach
         </div><!-- banner -->

        </section>

        <section class="content">

             <div class="nav_link">
               <ul>
                    <li>
                        <div>
                            <a href="{{AppHelper::UrlRoute(false,'cart')}}">
                            <img src="/assets/images/shoppingcart.png" >
                            <b>购物车</b>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="{{AppHelper::UrlRoute(false,'orders')}}">
                            <img src="/assets/images/myorder.png" >
                            <b>我的订单</b>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="{{AppHelper::UrlRoute(false,'favorites')}}">
                            <img src="/assets/images/collection.png" >
                            <b>我的收藏</b>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div>
                            @if(Auth::merchant()->check())
                                <a href="{{AppHelper::UrlRoute(false,'merchants.home')}}">
                                <img src="/assets/images/userzone.png" >
                                <b>个人中心</b>
                                </a>
                            @else
                                <a href="{{AppHelper::UrlRoute(false,'customers.profile')}}">
                                <img src="/assets/images/userzone.png" >
                                <b>个人中心</b>
                                </a>
                            @endif
                        </div>
                    </li>
               </ul>

             </div>
             <div style="clear: both;"></div>
             {{--<div class="home-newproduct">--}}
                    {{--<div class="hn-title">--}}
                        {{--今日上新--}}
                    {{--</div>--}}
                    {{--<a href="#">--}}
                        {{--<div class="hn-left">--}}
                             {{--<div class="hnl-word">--}}
                                 {{--<div class="title"> 冬季补水首选 > </div>--}}
                                 {{--<div class="describe">爆款补水面膜</div>--}}
                             {{--</div>--}}
                             {{--<div class="hnl-img">--}}
                                 {{--<img src="/assets/images/tu07.jpg">--}}
                             {{--</div>--}}
                        {{--</div>--}}
                        {{--<div class="hn-right">--}}
                            {{--<div class="hnr-top">--}}
                               {{--<a href="#">--}}
                                    {{--<div class="hnrt-box">--}}
                                        {{--<div class="hnrtb-word">--}}
                                            {{--<div class="title">面部保湿</div>--}}
                                            {{--<div class="describe">深层补水保湿</div>--}}
                                        {{--</div>--}}
                                        {{--<div class="hnrtb-img"><img src="/assets/images/tu08.jpg"></div>--}}
                                    {{--</div>--}}
                                {{--</a>--}}
                            {{--</div>--}}
                            {{--<div class="hnr-bottom">--}}
                                {{--<div class="hnrb-l">--}}
                                  {{--<a href="#">--}}
                                   {{--<div class="hnrb-box">--}}
                                      {{--<div class="title">美白祛斑</div>--}}
                                      {{--<div class="img"><img src="/assets/images/tu09.jpg"></div>--}}
                                   {{--</div>--}}
                                  {{--</a>--}}
                                {{--</div>--}}
                                {{--<div class="hnrb-r">--}}
                                  {{--<a href="#">--}}
                                    {{--<div class="hnrb-box">--}}
                                      {{--<div class="title">紫草净痘</div>--}}
                                      {{--<div class="img"><img src="/assets/images/tu10.jpg"></div>--}}
                                    {{--</div>--}}
                                   {{--</a>--}}

                                {{--</div>--}}
                            {{--</div>--}}
                        {{--</div>--}}
                    {{--</a>--}}
             {{--</div><!-- 今日上新 -->--}}



             @foreach($categories as $key=>$category)
             <div class="home-newarrival">
                 <div class="bigtag">
                     <div class="bt-title">
                         {{$key+1}}F {{$category->name}}
                     </div>
                     <div class="bt-more">
                         <a href="{{AppHelper::UrlRoute(false,'products',['catId'=>$category->id])}}">更多</a>
                     </div>
                 </div>
                 <div class="tag-box" id="mytag">
                     <div class="hn-product-list clearfix">
                     {{--{{print_r(get_category_products($category))}}--}}
                            <ul class="hpl-ul">
                                @foreach(get_category_products($category) as $product)
                                <li>
                                 <a href="{{AppHelper::UrlRoute(false,'products.detail',array('id'=>$product->id))}}">
                                    {{--<div class="pro-logo"></div>--}}
                                    <div class="pro-img"><img src="{{$product->image?AppHelper::imgSrc($product->image->url):'/assets/images/tu11.jpg'}}"></div>
                                    <div class="pro-word">
                                       <div class="title" title="{{$product->name}}">{{mb_strcut($product->name, 0,56, 'utf-8')}}</div>
                                       <div class="price">
                                            <span class="span1">￥{{AppHelper::price($product->sale_price)}}</span>
                                            <span class="span2">已售{{$product->sale_count}}件</span>
                                        </div>
                                    </div>
                                  </a>
                                </li>
                                @endforeach
                                {{--<li>--}}
                                 {{--<a href="#">--}}
                                   {{--<div class="pro-logo"></div>--}}
                                    {{--<div class="pro-img"><img src="/assets/images/tu11.jpg"></div>--}}
                                    {{--<div class="pro-word">--}}
                                       {{--<div class="title">优理氏美白祛斑霜雀斑老年斑祛斑淡斑美白</div>--}}
                                       {{--<div class="price">--}}
                                            {{--<span class="span1">￥158.00</span>--}}
                                            {{--<span class="span2">已售672件</span>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                  {{--</a>--}}
                                {{--</li>--}}
                            </ul>
                     </div><!-- 新品上市 -->

                 </div>


             </div>
             @if($key+1 == ($categories->count()/2))
                @if($ad)
                <div class="home-ad">
                     <div class="ha-img"><img src="{{$ad->image?AppHelper::imgSrc($ad->image->url):''}}"></div>
                     <div class="ha-activity">
                        <div class="ha-tag">五折</div>
                        <div class="ha-content">{{mb_strcut($ad->title, 0,60, 'utf-8')}}</div>
                     </div>
                 </div><!-- 首页广告推荐 -->
                 @endif
             @endif
             @endforeach


        </section>
        <!-- content -->



    </div>
</div>
@stop