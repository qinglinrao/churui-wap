@extends('public.template')

@section('scripts')
<script>
    $(function(){
        var shareData = {
            title: '{{$shop->name}}',
            desc: '{{$shop->intro}}',
            link: '{{URL::route('shop',array('id'=>$shop->id))}}',
            imgUrl: '{{$shop->logoImage?AppHelper::imgSrc($shop->logoImage->url):location.origin+'/assets/images/tu02.jpg'}}'
        };
//        var ticket = 'sM4AOVdWfPE4DxkXGEs8VDnS3fBKqYJzuUVszz1ewGSmi76hc57e2HOlNRTghG_EIkMDBX-y4RQJlr9TW0AYCw';
        var ticket = '{{AppHelper::getWechatSignature()}}';
        $.wechatShare(shareData,ticket);
    })
</script>
@stop


@section('wrapper')

	<div class="sunn_wrapper">
        <div id="sunn_main">
            <section class="header">
                <div class="htitle common">{{$shop->name}}的小铺</div>
                <a href="{{AppHelper::UrlRoute(false,'merchants.shop')}}" class="hleft"></a>
                @if($public)
                <a href="javascript:alert('点击微信右上角就可以分享哦～')" class="hright">分享</a>
                @endif
            </section><!-- 头部 -->

            <section class="banner">
              <img  src="{{$shop->coverImage?AppHelper::imgSrc($shop->coverImage->url):'/assets/images/banner01.jpg'}}" >
            </section>


            <section class="content">

            <div class="store-top-box">
                   <div class="store-top">
                      <a href="#">
                       <div class="storepic">
                           <img src="{{$shop->logoImage?AppHelper::imgSrc($shop->logoImage->url):'/assets/images/tu02.jpg'}}">
                       </div>
                       <div class="word">
                            <div class="wcoc store-name">{{$shop->name}}</div>
                            <div class="wcoc weixin"> {{$shop->weixin}}</div>
                       </div>
                       <div class="arrow"></div>
                      </a>
                   </div>

                   <div class="describe">
                        {{$shop->intro}}
                         {{--创立于2006年，是一家集生产、研发、销售、培训为一体的现代化化妆品集团型企业。公司拥有“优理氏、white+cap、香草魔法、永恒情书”等多个护肤品牌，并形成了以“生产研发、代理加盟、电子商务”为支柱的三大产业集团。--}}
                   </div>
            </div>
            {{--<pre>{{print_r($_SERVER)}}</pre>--}}

            <div class="product-list">
                   <div class="pl-category">
                       <ul class="pc-ul preview">
                           <li><a href="{{$url}}" class="{{$sort=='created_at'?'active':''}}">新品</a></li>
                           <li><a href="{{$url.'?sort=sale_price'}}" class="{{$sort=='sale_price'?'active':''}} ">价格</a></li>
                           <li><a href="{{$url.'?sort=sale_count'}}" class="{{$sort=='sale_count'?'active':''}} ">销量</a></li>
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
                       店铺中还没有任何商品~~
                   </div>
                   @endif
              </div><!-- 产品列表 -->


            </section>
            <!-- content -->



        </div>
    </div>

    @if($public && !Cookie::has('share_tip'))
    <!-- 弹窗分享提示 -->
    <div class="share_shop_tip">
        <div class="title"> 分享提示</div>
        <p>点击微信右上角就可以分享哦～</p>
        <div class="btns">
           <input type="button" value="我知道了" class="ok">
           <input type="button" value="不再提示" class="no">
        </div>
    </div>
    <div class="over-layer"></div>
    @endif

@stop

