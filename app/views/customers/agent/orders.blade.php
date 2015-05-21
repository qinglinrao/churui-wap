@extends('public.html')

@section('wrapper')
    <div class="top">
        <ul>
            <li class="back-arrow">
                <a href="javascript:history.go(-1)">
                    <img src="/assets/images/churui/back-arrow.png" width="60%" height="60%">
                </a>
            </li>
            <li class="title">
                我的订单
            </li>
            <li class="forward">
                <a href="#" class="shenqing">
                </a>
            </li>
        </ul>
    </div>
    <!-- top -->
    <div class="l-contert l-contert-bg">
        <div class="slideTxtBox">
            <div class="hd">
                <ul>
                    <li>
                        全部
                    </li>
                    <li>
                        待付款
                    </li>
                    <li>
                        已付款
                    </li>
                    <li>
                        已分润
                    </li>
                </ul>
            </div>
            <div class="bd">
                <ul>
                    @foreach($orders as $order)
                    <li class="yonghu">
                        <a href="">
                            <div class="yonghu-photo">
                                <img src="/assets/images/churui/myphoto.jpg" width="100%" height="100%" border="0" alt="用户头像">
                            </div>
                            <p>
                                    <span class="name">
                                        {{ $order->buyer->detail->username }}
                                    </span>
                                    <span class="time">
                                        {{$order->created_at}}
                                    </span>
                            </p>
                        </a>
                    </li>

                        @foreach($order->products as $product)
                        <li class="mydd-lists">
                            <div class="mydd-list">
                                <a href="">
                                    <div class="shangping-photo">
                                        <img src="{{$product->product&&$product->product->image?AppHelper::imgSrc($product->product->image->url):''}}" width="100%" height="100%" border="0" alt="商品图片">
                                    </div>
                                    <p class="shangping-title">
                                        {{mb_substr( $product->name, 0, 22, 'utf-8')}}
                                    </p>
                                </a>
                                <p class="price">
                                    ￥{{$product->price}}
                                </p>
                                <p>
                                        <span class="kefenrun">
                                            可分润：
                                            <b>
                                                ￥{{$product->product->profit}}
                                            </b>
                                        </span>
                                        <span class="mydd-num">
                                            ×{{$product->quantity}}
                                        </span>
                                </p>
                            </div>
                        </li>
                        @endforeach
                    <li class="mydd-sum">
                        <div class="mydd-sum1">
                                <span class="mydd-sum-num">
                                    {{get_order_product_num($order)}}件商品
                                </span>
                                <span class="mydd-shifu">
                                    实付：
                                    <b>
                                        ￥{{$order->total}}
                                    </b>
                                </span>
                                <span class="mydd-fenrun">
                                    分润：
                                    <b>
                                        ￥146.00
                                    </b>
                                </span>
                        </div>
                    </li>
                    <li class="mydd-zhuangtai">
                        <div class="mydd-ddzhuangtai">
                            已支付
                        </div>
                    </li>
                    @endforeach
                </ul>
                <!-- 全部 -->
                <ul>
                    <li class="yonghu">
                        <a href="">
                            <div class="yonghu-photo">
                                <img src="/assets/images/churui/myphoto.jpg" width="100%" height="100%" border="0" alt="用户头像">
                            </div>
                            <p>
                                    <span class="name">
                                        珍妮
                                    </span>
                                    <span class="time">
                                        14-12-26 20:00
                                    </span>
                            </p>
                        </a>
                    </li>
                    <li class="mydd-list">
                        <div class="mydd-list">
                            <a href="">
                                <div class="shangping-photo">
                                    <img src="/assets/images/churui/example1.jpg" width="100%" height="100%" border="0" alt="商品图片">
                                </div>
                                <p class="shangping-title">
                                    UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液
                                </p>
                            </a>
                            <p class="price">
                                ￥158.00
                            </p>
                            <p>
                                    <span class="kefenrun">
                                        可分润：
                                        <b>
                                            ￥58.00
                                        </b>
                                    </span>
                                    <span class="mydd-num">
                                        ×1
                                    </span>
                            </p>
                        </div>
                    </li>
                    <li class="mydd-list">
                        <div class="mydd-list">
                            <a href="">
                                <div class="shangping-photo">
                                    <img src="/assets/images/churui/example1.jpg" width="100%" height="100%" border="0" alt="商品图片">
                                </div>
                                <p class="shangping-title">
                                    UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液
                                </p>
                            </a>
                            <p class="price">
                                ￥188.00
                            </p>
                            <p>
                                    <span class="kefenrun">
                                        可分润：
                                        <b>
                                            ￥88.00
                                        </b>
                                    </span>
                                    <span class="mydd-num">
                                        ×1
                                    </span>
                            </p>
                        </div>
                    </li>
                    <li class="mydd-sum">
                        <div class="mydd-sum1">
                                <span class="mydd-sum-num">
                                    2件商品
                                </span>
                                <span class="mydd-shifu">
                                    实付：
                                    <b>
                                        ￥346.00
                                    </b>
                                </span>
                                <span class="mydd-fenrun">
                                    分润：
                                    <b>
                                        ￥146.00
                                    </b>
                                </span>
                        </div>
                    </li>
                    <li class="mydd-zhuangtai">
                        <div class="mydd-ddzhuangtai">
                            未支付
                        </div>
                    </li>
                </ul>
                <!-- 待付款 -->
                <ul>
                    <li class="yonghu">
                        <a href="">
                            <div class="yonghu-photo">
                                <img src="/assets/images/churui/myphoto.jpg" width="100%" height="100%" border="0" alt="用户头像">
                            </div>
                            <p>
                                    <span class="name">
                                        珍妮
                                    </span>
                                    <span class="time">
                                        14-12-26 20:00
                                    </span>
                            </p>
                        </a>
                    </li>
                    <li class="mydd-list">
                        <div class="mydd-list">
                            <a href="">
                                <div class="shangping-photo">
                                    <img src="/assets/images/churui/example1.jpg" width="100%" height="100%" border="0" alt="商品图片">
                                </div>
                                <p class="shangping-title">
                                    UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液
                                </p>
                            </a>
                            <p class="price">
                                ￥158.00
                            </p>
                            <p>
                                    <span class="kefenrun">
                                        可分润：
                                        <b>
                                            ￥58.00
                                        </b>
                                    </span>
                                    <span class="mydd-num">
                                        ×1
                                    </span>
                            </p>
                        </div>
                    </li>
                    <li class="mydd-list">
                        <div class="mydd-list">
                            <a href="">
                                <div class="shangping-photo">
                                    <img src="/assets/images/churui/example1.jpg" width="100%" height="100%" border="0" alt="商品图片">
                                </div>
                                <p class="shangping-title">
                                    UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液
                                </p>
                            </a>
                            <p class="price">
                                ￥188.00
                            </p>
                            <p>
                                    <span class="kefenrun">
                                        可分润：
                                        <b>
                                            ￥88.00
                                        </b>
                                    </span>
                                    <span class="mydd-num">
                                        ×1
                                    </span>
                            </p>
                        </div>
                    </li>
                    <li class="mydd-sum">
                        <div class="mydd-sum1">
                                <span class="mydd-sum-num">
                                    2件商品
                                </span>
                                <span class="mydd-shifu">
                                    实付：
                                    <b>
                                        ￥346.00
                                    </b>
                                </span>
                                <span class="mydd-fenrun">
                                    分润：
                                    <b>
                                        ￥146.00
                                    </b>
                                </span>
                        </div>
                    </li>
                    <li class="mydd-zhuangtai">
                        <div class="mydd-ddzhuangtai">
                            已支付
                        </div>
                    </li>
                </ul>
                <!-- 已付款 -->
                <ul>
                    <li>
                        <div class="yfr-title">
                                <span class="yfr-date">
                                    2014-12-26
                                </span>
                                <span class="arrow down">
                                </span>
                        </div>
                    </li>
                    <li>
                        <div class="yfr-title">
                                <span class="yfr-date">
                                    2014-12-25
                                </span>
                                <span class="arrow down">
                                </span>
                        </div>
                        <ul class="menu" style="display:none;">
                            <li class="yonghu">
                                <a href="">
                                    <div class="yonghu-photo">
                                        <img src="/assets/images/churui/myphoto.jpg" width="100%" height="100%" border="0" alt="用户头像">
                                    </div>
                                    <p>
                                            <span class="name">
                                                珍妮
                                            </span>
                                    </p>
                                </a>
                            </li>
                            <li class="mydd-lists">
                                <div class="mydd-list">
                                    <a href="">
                                        <div class="shangping-photo">
                                            <img src="/assets/images/churui/example1.jpg" width="100%" height="100%" border="0" alt="商品图片">
                                        </div>
                                        <p class="shangping-title">
                                            UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液
                                        </p>
                                    </a>
                                    <p class="price">
                                        ￥158.00
                                    </p>
                                    <p>
                                            <span class="kefenrun">
                                                可分润：
                                                <b>
                                                    ￥58.00
                                                </b>
                                            </span>
                                            <span class="mydd-num">
                                                ×1
                                            </span>
                                    </p>
                                </div>
                            </li>
                            <li class="mydd-lists">
                                <div class="mydd-list">
                                    <a href="">
                                        <div class="shangping-photo">
                                            <img src="/assets/images/churui/example1.jpg" width="100%" height="100%" border="0" alt="商品图片">
                                        </div>
                                        <p class="shangping-title">
                                            UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液
                                        </p>
                                    </a>
                                    <p class="price">
                                        ￥188.00
                                    </p>
                                    <p>
                                            <span class="kefenrun">
                                                可分润：
                                                <b>
                                                    ￥88.00
                                                </b>
                                            </span>
                                            <span class="mydd-num">
                                                ×1
                                            </span>
                                    </p>
                                </div>
                            </li>
                            <li class="mydd-sum">
                                <div class="mydd-sum1">
                                        <span class="mydd-sum-num">
                                            2件商品
                                        </span>
                                        <span class="mydd-shifu">
                                            实付：
                                            <b>
                                                ￥346.00
                                            </b>
                                        </span>
                                        <span class="mydd-fenrun">
                                            分润：
                                            <b>
                                                ￥146.00
                                            </b>
                                        </span>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <div class="yfr-title">
                                <span class="yfr-date">
                                    2014-12-24
                                </span>
                                <span class="arrow down">
                                </span>
                        </div>
                    </li>
                    <li>
                        <div class="yfr-title">
                                <span class="yfr-date">
                                    2014-12-23
                                </span>
                                <span class="arrow down">
                                </span>
                        </div>
                    </li>
                    <li>
                        <div class="yfr-title">
                                <span class="yfr-date">
                                    2014-12-22
                                </span>
                                <span class="arrow down">
                                </span>
                        </div>
                    </li>
                    <li>
                        <div class="yfr-title">
                                <span class="yfr-date">
                                    2014-12-21
                                </span>
                                <span class="arrow down">
                                </span>
                        </div>
                    </li>
                    <li>
                        <div class="yfr-title">
                                <span class="yfr-date">
                                    2014-12-20
                                </span>
                                <span class="arrow down">
                                </span>
                        </div>
                    </li>
                    <li>
                        <div class="yfr-title">
                                <span class="yfr-date">
                                    2014-12-19
                                </span>
                                <span class="arrow down">
                                </span>
                        </div>
                    </li>
                    <li>
                        <div class="bottom-bar">
                                <span class="yfr-sum-num">
                                    3件商品
                                </span>
                                <span class="yfr-zongji">
                                    总计：￥158.00
                                </span>
                                <span class="yfr-fr">
                                    分润：
                                    <b>
                                        ￥204.00
                                    </b>
                                </span>
                        </div>
                    </li>
                </ul>
                <!-- 已分润 -->
            </div>
        </div>
    </div>
@section('scripts')
@parent
<script type="text/javascript">
    $(document).ready(function() {
        jQuery(".slideTxtBox").slide({});
    });
</script>
<script type="text/javascript"> /* 已分润 */
    $(document).ready(function() {
        /* 滑动/展开 */
        $("div.yfr-title").click(function() {

            var arrow = $(this).find("span.arrow");

            if (arrow.hasClass("up")) {
                arrow.removeClass("up");
                arrow.addClass("down");
            } else if (arrow.hasClass("down")) {
                arrow.removeClass("down");
                arrow.addClass("up");
            }

            $(this).parent().find("ul.menu").slideToggle();

        });
    });
</script>
@stop
@stop