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
                    @foreach($orders as $order)
                    @foreach($order->products as $product)
                    <div class="ddlb-daifukuang">
                        <div  class="ddlb-xinxi">
                            <div  class="ddlb-list">
                                <a href="" class="shangping-url">
                                    <div  class="sp-photo">
                                        <img src="{{$product->product&&$product->product->image?AppHelper::imgSrc($product->product->image->url):''}}" width="100%" height="100%" border="0" alt="商品图片">
                                    </div>
                                    <div  class="sp-title">
                                        {{mb_substr( $product->name, 0, 22, 'utf-8')}}
                                    </div>
                                    <div  class="sp-xinxi">
                                        <p class="sp-price">￥{{$product->price}}</p>
                                        <p class="sp-num">×{{$product->quantity}}</p>
                                    </div>
                                </a>
                            </div>
                            <div  class="ddlb-sum">
                                <span class="total-num">共<b>{{get_order_product_num($order)}}</b>件商品 </span>
                               {{-- <span class="yunfei">运费：<b>￥0.00</b></span>--}}
                                <span class="total-price">实付：<b>￥{{$order->total}}</b></span>
                            </div>
                        </div>
                        <div  class="ddlb-zhuangtai">
                            <a href="#"> <div  class="ddlb-zhifu">{{get_order_deal_operate($order)}}</div></a>
                        </div>
                    </div>
                    @endforeach
                    @endforeach



                </ul><!--全部-->

                <ul>
                    @foreach($orders1 as $order)
                    @foreach($order->products as $product)
                    <div class="ddlb-daifukuang">
                        <div  class="ddlb-xinxi">
                            <div  class="ddlb-list">
                                <a href="" class="shangping-url">
                                    <div  class="sp-photo">
                                        <img src="{{$product->product&&$product->product->image?AppHelper::imgSrc($product->product->image->url):''}}" width="100%" height="100%" border="0" alt="商品图片">
                                    </div>
                                    <div  class="sp-title">
                                        {{$order->order_title}}
                                    </div>
                                    <div  class="sp-xinxi">
                                        <p class="sp-price">￥{{$product->price}}</p>
                                        <p class="sp-num">×{{$product->quantity}}</p>
                                    </div>
                                </a>
                            </div>
                            <div  class="ddlb-sum">
                                <span class="total-num">共<b>{{get_order_product_num($order)}}</b>件商品 </span>
                                {{--<span class="yunfei">运费：<b>￥0.00</b></span>--}}
                                <span class="total-price">实付：<b>￥{{$order->total}}</b></span>
                            </div>
                        </div>
                        <div  class="ddlb-zhuangtai">
                            <a href="#"> <div  class="ddlb-zhifu">{{get_order_deal_operate($order)}}</div></a>
                        </div>
                    </div>
                    @endforeach
                    @endforeach

                </ul><!--代付款-->

                <ul>
                    @foreach($orders3 as $order)
                    @foreach($order->products as $product)
                    <div class="ddlb-daishouhuo">
                        <div  class="ddlb-xinxi">
                            <div  class="ddlb-list">
                                <a href="" class="shangping-url">
                                    <div  class="sp-photo">
                                        <img src="{{$product->product&&$product->product->image?AppHelper::imgSrc($product->product->image->url):''}}" width="100%" height="100%" border="0" alt="商品图片">
                                    </div>
                                    <div  class="sp-title">
                                        {{$order->order_title}}
                                    </div>
                                    <div  class="sp-xinxi">
                                        <p class="sp-price">￥{{$product->price}}</p>
                                        <p class="sp-num">×{{$product->quantity}}</p>
                                    </div>
                                </a>
                            </div>

                            <div  class="ddlb-sum">
                                <span class="total-num">共<b>{{get_order_product_num($order)}}</b>件商品 </span>
                                {{--<span class="yunfei">运费：<b>￥0.00</b></span>--}}
                                <span class="total-price">实付：<b>￥{{$order->total}}</b></span>
                            </div>
                        </div>
                        <div  class="ddlb-zhuangtai">
                            <a href="#"> <div  class="ddlb-shouhuo">{{get_order_deal_operate($order)}}</div></a>
                            <a href="#"> <div  class="ddlb-checkwuliu">查看物流</div></a>
                        </div>
                    </div>
                        @endforeach
                        @endforeach
                </ul><!--待收货-->
                <ul>

                    @foreach($orders4 as $order)
                    @foreach($order->products as $product)
                    <div class="ddlb-daipingjia">
                        <div  class="ddlb-xinxi">
                            <div  class="ddlb-list">
                                <a href="" class="shangping-url">
                                    <div  class="sp-photo">
                                        <img src="{{$product->product&&$product->product->image?AppHelper::imgSrc($product->product->image->url):''}}" width="100%" height="100%" border="0" alt="商品图片">
                                    </div>
                                    <div  class="sp-title">
                                        {{$order->order_title}}
                                    </div>
                                    <div  class="sp-xinxi">
                                        <p class="sp-price">￥{{$product->price}}</p>
                                        <p class="sp-num">×{{$product->quantity}}</p>
                                    </div>
                                </a>
                            </div>
                            <div  class="ddlb-sum">
                                <span class="total-num">共<b>{{get_order_product_num($order)}}</b>件商品 </span>
                               {{-- <span class="yunfei">运费：<b>￥0.00</b></span>--}}
                                <span class="total-price">实付：<b>￥{{$order->total}}</b></span>
                            </div>
                        </div>
                        <div  class="ddlb-zhuangtai">
                            <a href="#"> <div  class="ddlb-pingjia">{{get_order_deal_operate($order)}}</div></a>
                            <a href="#"> <div  class="ddlb-delete">删除订单</div></a>
                        </div>
                    </div>
                        @endforeach
                        @endforeach
                </ul><!--待评价-->
            </div>
        </div>


    </div>
@section('scripts')
    @parent
    <script type="text/javascript">
        $(document).ready(function(){
            $('#photo-upload').fileupload({
                url: '/photo-upload',
                dataType: 'json',
                formData: {},
                done: function (e, data) {
                    var $data = data.result;
                    $('#photo-warp').empty();
                    $('#photo-warp').append('<div class="item">\
                <div class="image">\
                    <img src="/'+$data.url+'">\
                </div>\
                <div class="content">\
                    <input type="text" placeholder="图片ALT" name="image[alt]">\
                    <input type="hidden" name="image[id]" value="'+$data.id+'">\
                </div>\
            </div>')
                }
            });
        });
    </script>
@stop
@stop