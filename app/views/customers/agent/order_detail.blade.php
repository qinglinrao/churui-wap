@extends('public.html')

@section('wrapper')

    <div class="top">
        <ul>
            <li class="back-arrow"><a href="javascript:history.go(-1)"><img src="/assets/images/churui/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">订单详情</li>
            <li class="forward"><a href="#" ></a></li>
        </ul>
    </div>


    <div  class="content">
        <div  class="dd-zhuangtai">
            <div  class="dd-title">
                <p>订单状态： <span class="dd-zt">待支付</span></p>
            </div>
            <div  class="receive-detailed">
                <p><span class="receiver">收货人：煲仔</span>
                    <span class="tel">18845697458</span></p>
                <p class="add">收货地址：广东省广州市天河区棠东东路御富科贸园御景B座202</p>
                <p class="youbian">邮编： 510000</p>
            </div>
        </div>

        <div  class="dd-xinxi">
            <div  class="dd-title">
                订单信息
            </div>
            <div  class="dd-detailed">
                <div  class="dd-list">
                    <a href="" class="shangping-url">
                        <div  class="sp-photo">
                            <img src="/assets/images/churui/example.jpg" width="100%" height="100%" border="0" alt="商品图片">
                        </div>
                        <div  class="sp-title">
                            美即mg野玫瑰紧肤舒颜面膜欢乐限量版预防细纹紧致护肤
                        </div>
                        <div  class="sp-xinxi">

                            <p class="sp-price">￥198.00</p>
                            <p class="sp-num">×1</p>

                        </div>
                    </a>
                </div>
            </div>
            <div  class="dd-sum">
                <span class="total-num">共<b>1</b>件商品 </span>
                <span class="yunfei">运费：<b>￥0.00</b></span>
                <span class="total-price">实付：<b>￥198.00</b></span>
            </div>
        </div>

        <a href="#"> <div  class="weixinzhifu">微信支付</div></a>
    </div>
@stop