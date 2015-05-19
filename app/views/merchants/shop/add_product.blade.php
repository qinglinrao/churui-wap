@extends('public.template')

@section('wrapper')

<div class="sunn_wrapper">
    <div id="sunn_main">
        <p class="form-tip">{{$errors->first()}}</p>
        <section class="header">
            <div class="search">
            {{Form::open(array('url'=>URL::route('merchants.shop.product_list'),'method'=>'get'))}}
            <input type="submit" class="input-submit">
            {{Form::hidden('sort',$sort)}}
            <input type="text" name="query" class="input-text" placeholder="搜索产品">
            </div>
            <a href="{{URL::route('merchants.shop')}}" class="hleft"></a>
            <a href="{{URL::route('merchants.shop.product_category')}}" class="hright">筛选</a>
            {{Form::close()}}
        </section><!-- 头部 -->




        <section class="content">

          <div class="product-list addproduct">
               <div class="pl-category">
                   <ul class="pc-ul addp">
                       <li><a href="{{URL::route($route,array('catId'=>$catId))}}" class="{{$sort=='created_at'?'active':''}}">新品</a></li>
                       <li><a href="{{URL::route($route,array('catId'=>$catId,'sort'=>'comment_count'))}}" class="{{$sort=='comment_count'?'active':''}}">热评</a></li>
                       <li><a href="{{URL::route($route,array('catId'=>$catId,'sort'=>'sale_price'))}}" class="{{$sort=='sale_price'?'active':''}}">价格</a></li>
                       <li><a href="{{URL::route($route,array('catId'=>$catId,'sort'=>'sale_count'))}}" class="{{$sort=='sale_count'?'active':''}}">销量</a></li>
                       <li><a href="{{URL::route($route,array('catId'=>$catId,'sort'=>'collection_count'))}}" class="{{$sort=='collection_count'?'active':''}}">收藏</a></li>
                   </ul>
               </div>
               <ul class="pl-ul">
                   @foreach($products as $product)
                   <li>
                      <div class="limg">

                        <img src="{{$product->image?AppHelper::imgSrc($product->image->url):'/assets/images/tu03.jpg'}}"></div>
                      <div class="liword">
                          <div class="title">{{$product->name}}</div>
                          <div class="market-price">￥{{AppHelper::money($product->sale_price)}}</div>
                          <div class="repertory split">可分润:<span>￥{{AppHelper::money(get_product_profit($product,Auth::merchant()->user(),true))}}</span></div>
                      </div>
                      <a href="{{URL::route('merchants.shop.add_product',array('id'=>$product->id))}}" class="addbutton">添加</a>
                   </li>
                   @endforeach
                   {{--<li>--}}
                      {{--<div class="limg"><img src="../images/tu03.jpg"></div>--}}
                      {{--<div class="liword">--}}
                          {{--<div class="title">UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液</div>--}}
                          {{--<div class="market-price">￥58.00</div>--}}
                          {{--<div class="repertory split">可分润:<span>￥58.00</span></div>--}}
                      {{--</div>--}}
                      {{--<a href="#" class="addbutton">添加</a>--}}
                   {{--</li>--}}
                   {{--<li>--}}
                      {{--<div class="limg"><img src="../images/tu03.jpg"></div>--}}
                      {{--<div class="liword">--}}
                          {{--<div class="title">UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液</div>--}}
                          {{--<div class="market-price">￥58.00</div>--}}
                          {{--<div class="repertory split">可分润:<span>￥58.00</span></div>--}}
                      {{--</div>--}}
                      {{--<a href="#" class="addbutton">添加</a>--}}
                   {{--</li>--}}
                   {{--<li>--}}
                      {{--<div class="limg"><img src="../images/tu03.jpg"></div>--}}
                      {{--<div class="liword">--}}
                          {{--<div class="title">UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液</div>--}}
                          {{--<div class="market-price">￥58.00</div>--}}
                          {{--<div class="repertory split">可分润:<span>￥58.00</span></div>--}}
                      {{--</div>--}}
                      {{--<a href="#" class="addbutton">添加</a>--}}
                   {{--</li>--}}

               </ul>
          </div><!-- 产品列表 -->

        </section>
        <!-- content -->



    </div>
</div>

@stop