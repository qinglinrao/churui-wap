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
                <li style="width: 100%; height: 12.3rem;">
                    <img src="/assets/images/churui/example2.jpg" width="100%" height="100%" border="0" alt="商品图片">
                </li>
                <li style="width: 100%; height: 12.3rem;">
                    <img src="/assets/images/churui/example2.jpg" width="100%" height="100%" border="0" alt="商品图片">
                </li>
                <li style="width: 100%; height: 12.3rem;">
                    <img src="/assets/images/churui/example2.jpg" width="100%" height="100%" border="0" alt="商品图片">
                </li>
            </ul>


        </div>
        <div  class="spxq-title">
            <p>美即mg野玫瑰紧肤舒颜面膜欢乐限量版预防细纹紧致护肤正品护肤品</p>
        </div>
        <div  class="spxq-price">
            <b>￥198.00</b> 市场价：<s>￥698.00</s>
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
                图文详情
                <span class="spxq-tip">建议在WIFI下查看</span>
            </div>
        </a>
    </div>
    <a href="">
        <div  class="spxq-buy">
            <p>立即购买</p>
        </div>
    </a>
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