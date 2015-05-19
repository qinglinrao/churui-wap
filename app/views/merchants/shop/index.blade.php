@extends('public.template')

@section('wrapper')

<div class="sunn_wrapper">
    <div id="sunn_main">

        <section class="header">
            <div class="htitle common">我的店铺</div>
            <a href="{{URL::route('merchants.home')}}" class="hleft"></a>
            <a href="{{URL::route('merchants.shop.product_list')}}" class="hright">添加</a>
        </section><!-- 头部 -->

        <section class="content">

         <div class="store-top-box">

               <div class="store-top">
                 <a href="{{URL::route('merchants.shop.edit',array('id'=>$shop->id))}}">
                  <div class="storepic">
                      <img src="{{$shop->logoImage?AppHelper::imgSrc($shop->logoImage->url):'/assets/images/tu04.jpg'}}">
                  </div>
                  <div class="word">
                       <div class="wcoc store-name">{{$shop->name}}</div>
                       <div class="wcoc weixin">{{$shop->weixin}}</div>
                  </div>
                  <div class="arrow"></div>
                 </a>
              </div>

               <div class="seelinks">
                   <a href="{{URL::route('merchants.shop.preview')}}" class="slrow br">
                       <div class="sr-bl seestore">预览店铺</div>
                   </a>
                   <a href="{{URL::route('shop',array('id'=>$shop->id))}}" class="slrow" >
                      <div class="sr-bl copylinks">分享店铺</div>
                  </a>
                   {{--<a href="#" class="slrow" id="copy_input" data-val="{{URL::route('shop',array('id'=>$shop->id))}}">--}}
                       {{--<div class="sr-bl copylinks">复制链接</div>--}}
                   {{--</a>--}}
               </div>
          </div><!-- 我的店铺头部信息 -->

          <div class="product-list">
               <div class="pl-category">
                   <ul class="pc-ul">
                       <li><a href="{{URL::route('merchants.shop')}}" class="{{$sort=='created_at'?'active':''}}">新品</a></li>
                       <li><a href="{{URL::route('merchants.shop').'?sort=sale_price'}}" class="{{$sort=='sale_price'?'active':''}} ">价格</a></li>
                       <li><a href="{{URL::route('merchants.shop').'?sort=sale_count'}}" class="{{$sort=='sale_count'?'active':''}} ">销量</a></li>
                       <li><a href="{{URL::route('merchants.shop').'?sort=stock'}}" class="{{$sort=='stock'?'active':''}} ">库存</a></li>
                   </ul>
               </div>
               @if($shop->products->count())
               <ul class="pl-ul">
                   @foreach($shop->products as $product)
                   <li>
                      <div class="limg"><img src="{{$product->image?AppHelper::imgSrc($product->image->url):''}}"></div>
                      <div class="liword">
                          <div class="title"><a href="{{AppHelper::UrlRoute(false,'products.detail',array('id'=>$product->id)).'?SPID='.base64_encode(get_shop_product_id($shop->id,$product->id)).'&MID='.base64_encode($shop->owner->id)}}"> {{$product->name}}</a></div>
                          <div class="price">￥{{$product->sale_price}}</div>
                          <div class="repertory"><span>销量：{{$product->sale_count}}</span><span>库存：{{$product->stock}}</span></div>
                      </div>
                   </li>
                   @endforeach

               </ul>
               @else
               <div class="no-result-tip">
                    您的店铺还没有任何商品~~
               </div>
               @endif
          </div><!-- 产品列表 -->

        </section>
        <!-- content -->



    </div>
</div>

@stop