@extends('public.html')

@section('wrapper')

    <div class="top">
        <ul>
            <li class="back-arrow"><a href="#"><img src="/assets/images/churui/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">商品详情</li>
            <li class="forward"><a href="#" ></a></li>
        </ul>
    </div>


    <div  class="spxq-sp">
        <div  class="spxq-photo yiz-slider-2">
            <ul style="width: 100%;  left: 0px;">
                @foreach($product->images as $image)
                <li style="width: 100%; height: 12.3rem;">
                    {{--<img src="/assets/images/churui/example2.jpg" width="100%" height="100%" border="0" alt="商品图片">--}}
                    {{AppHelper::img($image->url,$image->alt,array('width'=>'100%','height'=>'100%','border'=>0,'alt'=>'商品图片'))}}
                </li>
                {{--<li style="width: 100%; height: 12.3rem;">
                    <img src="/assets/images/churui/example2.jpg" width="100%" height="100%" border="0" alt="商品图片">
                </li>
                <li style="width: 100%; height: 12.3rem;">
                    <img src="/assets/images/churui/example2.jpg" width="100%" height="100%" border="0" alt="商品图片">
                </li>--}}
                @endforeach
            </ul>


        </div>
        <div  class="spxq-title">
            <p>{{$product->name}}</p>
        </div>
        <div  class="spxq-price">
            <b>￥{{AppHelper::price($product->sale_price)}}</b> 市场价：<s>￥{{AppHelper::price($product->par_price)}}</s>
        </div>
    </div>
    <div  class="spxq-sp1">
        <a href="">
            <div  class="spxq-pj">
                商品评价
            </div>
        </a>
        <a href="">
            <div  class="spxq-tuwen">
                <a href="{{URL::route('products.more',array('id'=>$product->id,'SPID'=>Input::get('SPID'),'MID'=>Input::get('MID')))}}">图文详情</a>
                <span class="spxq-tip">建议在WIFI下查看</span>
            </div>
        </a>
    </div>
    @include('products._attributes')

    <div id="footer">
        <a href="javascript:void(0)">
            <div  class="spxq-buy">
                <p class="buy-button">立即购买</p>
            </div>
        </a>

    </div>
@section('scripts')
    @parent
    <script src="/assets/js/jquery.ScrollPic.js " type="text/javascript "></script>

    <script type="text/javascript">

        $(function(){

            $('.yiz-slider-2').ScrollPic({
                Time: '3000',
                speed: '1000',
                autoscrooll: true
            });
        })
    </script>
@stop
@stop