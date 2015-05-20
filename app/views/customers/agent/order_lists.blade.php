@extends('public.html')

@section('wrapper')
    <div class="top">
        <ul>
            <li class="back-arrow"><a href="javascript:history.go(-1)"><img src="/assets/images/churui/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">订单列表</li>
            <li class="forward"> <a href="#" class="shenqing"></a></li>
        </ul>
    </div><!-- top -->


    <div class="l-contert l-contert-bg">
        <div class="slideTxtBox">
            <div class="hd">
                <ul>
                    <li>全部</li>
                    <li>待付款</li>
                    <li>待收货</li>
                    <li>待评价</li>
                </ul>
            </div>


            <div class="bd">
                <ul>
                    <div class="ddlb-daifukuang">
                        <div  class="ddlb-xinxi">
                            <div  class="ddlb-list">
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
                            <div  class="ddlb-sum">
                                <span class="total-num">共<b>1</b>件商品 </span>
                                <span class="yunfei">运费：<b>￥0.00</b></span>
                                <span class="total-price">实付：<b>￥198.00</b></span>
                            </div>
                        </div>
                        <div  class="ddlb-zhuangtai">
                            <a href="#"> <div  class="ddlb-zhifu">支付</div></a>
                        </div>
                    </div>

                    <div class="ddlb-daishouhuo">
                        <div  class="ddlb-xinxi">
                            <div  class="ddlb-list">
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

                            <div  class="ddlb-sum">
                                <span class="total-num">共<b>1</b>件商品 </span>
                                <span class="yunfei">运费：<b>￥0.00</b></span>
                                <span class="total-price">实付：<b>￥198.00</b></span>
                            </div>
                        </div>
                        <div  class="ddlb-zhuangtai">
                            <a href="#"> <div  class="ddlb-shouhuo">确认收货</div></a>
                            <a href="#"> <div  class="ddlb-checkwuliu">查看物流</div></a>
                        </div>
                    </div>

                    <div class="ddlb-daipingjia">
                        <div  class="ddlb-xinxi">
                            <div  class="ddlb-list">
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
                            <div  class="ddlb-sum">
                                <span class="total-num">共<b>1</b>件商品 </span>
                                <span class="yunfei">运费：<b>￥0.00</b></span>
                                <span class="total-price">实付：<b>￥198.00</b></span>
                            </div>
                        </div>
                        <div  class="ddlb-zhuangtai">
                            <a href="#"> <div  class="ddlb-pingjia">评价订单</div></a>
                            <a href="#"> <div  class="ddlb-delete">删除订单</div></a>
                        </div>
                    </div>

                </ul><!--全部-->

                <ul>
                    <div class="ddlb-daifukuang">
                        <div  class="ddlb-xinxi">
                            <div  class="ddlb-list">
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
                            <div  class="ddlb-sum">
                                <span class="total-num">共<b>1</b>件商品 </span>
                                <span class="yunfei">运费：<b>￥0.00</b></span>
                                <span class="total-price">实付：<b>￥198.00</b></span>
                            </div>
                        </div>
                        <div  class="ddlb-zhuangtai">
                            <a href="#"> <div  class="ddlb-zhifu">支付</div></a>
                        </div>
                    </div>

                </ul><!--代付款-->

                <ul>
                    <div class="ddlb-daishouhuo">
                        <div  class="ddlb-xinxi">
                            <div  class="ddlb-list">
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

                            <div  class="ddlb-sum">
                                <span class="total-num">共<b>1</b>件商品 </span>
                                <span class="yunfei">运费：<b>￥0.00</b></span>
                                <span class="total-price">实付：<b>￥198.00</b></span>
                            </div>
                        </div>
                        <div  class="ddlb-zhuangtai">
                            <a href="#"> <div  class="ddlb-shouhuo">确认收货</div></a>
                            <a href="#"> <div  class="ddlb-checkwuliu">查看物流</div></a>
                        </div>
                    </div>
                </ul><!--待收货-->
                <ul>
                    <div class="ddlb-daipingjia">
                        <div  class="ddlb-xinxi">
                            <div  class="ddlb-list">
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
                            <div  class="ddlb-sum">
                                <span class="total-num">共<b>1</b>件商品 </span>
                                <span class="yunfei">运费：<b>￥0.00</b></span>
                                <span class="total-price">实付：<b>￥198.00</b></span>
                            </div>
                        </div>
                        <div  class="ddlb-zhuangtai">
                            <a href="#"> <div  class="ddlb-pingjia">评价订单</div></a>
                            <a href="#"> <div  class="ddlb-delete">删除订单</div></a>
                        </div>
                    </div>
                </ul><!--待评价-->
            </div>
        </div>


    </div>
@section('scripts')
    @parent
    <script type="text/javascript">
        $(document).ready(function(){
            jQuery(".slideTxtBox").slide({});
        });
    </script>
@stop
@stop