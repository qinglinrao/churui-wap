@extends('public.html')

@section('wrapper')
    <div class="top">
        <ul>
            <li class="back-arrow"><a href="javascript:history.go(-1)"><img src="/assets/images/churui/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">我的订单</li>
            <li class="forward"> <a href="#" class="shenqing"></a></li>
        </ul>
    </div><!-- top -->

    <div class="l-contert l-contert-bg">
        <div class="slideTxtBox">
            <div class="hd">
                <ul>
                    <li>全部</li>
                    <li>待付款</li>
                    <li>已付款</li>
                    <li>已分润</li>
                </ul>
            </div>
            <div class="bd">
                <ul>
                    <li class="yonghu">
                        <a href="">
                            <div  class="yonghu-photo">
                                <img src="/assets/images/churui/myphoto.jpg" width="100%" height="100%" border="0" alt="用户头像">
                            </div>
                            <p>
                                <span class="name">珍妮</span>
                                <span class="time">14-12-26  20:00</span>
                            </p>
                        </a>
                    </li>

                    <li class="mydd-lists">
                        <div  class="mydd-list">
                            <a href="">
                                <div  class="shangping-photo">
                                    <img src="/assets/images/churui/example1.jpg" width="100%" height="100%" border="0" alt="商品图片">
                                </div>
                                <p class="shangping-title">UNES优理氏玻尿酸原液     玻尿酸肽原液深层保湿面部精华补水精华液</p>
                            </a>
                            <p class="price">￥158.00</p>
                            <p >
                                <span class="kefenrun">可分润：<b>￥58.00</b></span>
                                <span class="mydd-num">×1</span>
                            </p>
                        </div>
                    </li>
                    <li class="mydd-lists">
                        <div  class="mydd-list">
                            <a href="">
                                <div  class="shangping-photo">
                                    <img src="/assets/images/churui/example1.jpg" width="100%" height="100%" border="0" alt="商品图片">
                                </div>
                                <p class="shangping-title">UNES优理氏玻尿酸原液     玻尿酸肽原液深层保湿面部精华补水精华液</p>
                            </a>
                            <p class="price">￥188.00</p>
                            <p >
                                <span class="kefenrun">可分润：<b>￥88.00</b></span>
                                <span class="mydd-num">×1</span>
                            </p>
                        </div>
                    </li>
                    <li class="mydd-sum">
                        <div  class="mydd-sum1">
                            <span class="mydd-sum-num">2件商品</span>
                            <span class="mydd-shifu">实付：<b>￥346.00</b></span>
                            <span class="mydd-fenrun">分润：<b>￥146.00</b></span>
                        </div>
                    </li>
                    <li class="mydd-zhuangtai">
                        <div  class="mydd-ddzhuangtai">
                            已支付
                        </div>
                    </li>
                </ul><!-- 全部 -->
                <ul>
                    <li class="yonghu">
                        <a href="">
                            <div  class="yonghu-photo">
                                <img src="/assets/images/churui/myphoto.jpg" width="100%" height="100%" border="0" alt="用户头像">
                            </div>
                            <p>
                                <span class="name">珍妮</span>
                                <span class="time">14-12-26  20:00</span>
                            </p>
                        </a>
                    </li>

                    <li class="mydd-list">
                        <div  class="mydd-list">
                            <a href="">
                                <div  class="shangping-photo">
                                    <img src="/assets/images/churui/example1.jpg" width="100%" height="100%" border="0" alt="商品图片">
                                </div>
                                <p class="shangping-title">UNES优理氏玻尿酸原液     玻尿酸肽原液深层保湿面部精华补水精华液</p>
                            </a>
                            <p class="price">￥158.00</p>
                            <p >
                                <span class="kefenrun">可分润：<b>￥58.00</b></span>
                                <span class="mydd-num">×1</span>
                            </p>
                        </div>
                    </li>
                    <li class="mydd-list">
                        <div  class="mydd-list">
                            <a href="">
                                <div  class="shangping-photo">
                                    <img src="/assets/images/churui/example1.jpg" width="100%" height="100%" border="0" alt="商品图片">
                                </div>
                                <p class="shangping-title">UNES优理氏玻尿酸原液     玻尿酸肽原液深层保湿面部精华补水精华液</p>
                            </a>
                            <p class="price">￥188.00</p>
                            <p >
                                <span class="kefenrun">可分润：<b>￥88.00</b></span>
                                <span class="mydd-num">×1</span>
                            </p>
                        </div>
                    </li>
                    <li class="mydd-sum">
                        <div  class="mydd-sum1">
                            <span class="mydd-sum-num">2件商品</span>
                            <span class="mydd-shifu">实付：<b>￥346.00</b></span>
                            <span class="mydd-fenrun">分润：<b>￥146.00</b></span>
                        </div>
                    </li>
                    <li class="mydd-zhuangtai">
                        <div  class="mydd-ddzhuangtai">
                            未支付
                        </div>
                    </li>
                </ul><!-- 待付款 -->
                <ul>
                    <li class="yonghu">
                        <a href="">
                            <div  class="yonghu-photo">
                                <img src="/assets/images/churui/myphoto.jpg" width="100%" height="100%" border="0" alt="用户头像">
                            </div>
                            <p>
                                <span class="name">珍妮</span>
                                <span class="time">14-12-26  20:00</span>
                            </p>
                        </a>
                    </li>

                    <li class="mydd-list">
                        <div  class="mydd-list">
                            <a href="">
                                <div  class="shangping-photo">
                                    <img src="/assets/images/churui/example1.jpg" width="100%" height="100%" border="0" alt="商品图片">
                                </div>
                                <p class="shangping-title">UNES优理氏玻尿酸原液     玻尿酸肽原液深层保湿面部精华补水精华液</p>
                            </a>
                            <p class="price">￥158.00</p>
                            <p >
                                <span class="kefenrun">可分润：<b>￥58.00</b></span>
                                <span class="mydd-num">×1</span>
                            </p>
                        </div>
                    </li>
                    <li class="mydd-list">
                        <div  class="mydd-list">
                            <a href="">
                                <div  class="shangping-photo">
                                    <img src="/assets/images/churui/example1.jpg" width="100%" height="100%" border="0" alt="商品图片">
                                </div>
                                <p class="shangping-title">UNES优理氏玻尿酸原液     玻尿酸肽原液深层保湿面部精华补水精华液</p>
                            </a>
                            <p class="price">￥188.00</p>
                            <p >
                                <span class="kefenrun">可分润：<b>￥88.00</b></span>
                                <span class="mydd-num">×1</span>
                            </p>
                        </div>
                    </li>
                    <li class="mydd-sum">
                        <div  class="mydd-sum1">
                            <span class="mydd-sum-num">2件商品</span>
                            <span class="mydd-shifu">实付：<b>￥346.00</b></span>
                            <span class="mydd-fenrun">分润：<b>￥146.00</b></span>
                        </div>
                    </li>
                    <li class="mydd-zhuangtai">
                        <div  class="mydd-ddzhuangtai">
                            已支付
                        </div>
                    </li>
                </ul><!-- 已付款 -->
                <ul>
                    <li class="">

                    </li>
                </ul><!-- 已分润 -->
            </div>
        </div>


    </div><!-- l-contert -->
@section('scripts')
@parent
    <script type="text/javascript">
        $(document).ready(function(){
            jQuery(".slideTxtBox").slide({});
        });
    </script>
@stop
@stop