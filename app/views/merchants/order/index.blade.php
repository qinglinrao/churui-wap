@extends('public.template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">

            <section class="header">
                <div class="htitle common">{{get_owner_merchant_name($leader)}}的订单</div>
                <a href="{{URL::route('merchants.home')}}" class="hleft"></a>
            </section><!-- 头部 -->

            <section class="content">
              <div class="myorder-top">
                  <div class="mt-category">
                      <ul class="mt-ul">
                           <li><a href="{{URL::route('merchants.orders',array('leader_id'=>base64_encode($leader->id)))}}" class="{{$status==10?'active':''}}">全部</a></li>
                           <li><a href="{{URL::route('merchants.orders',array('leader_id'=>base64_encode($leader->id),'status'=>1))}}" class="{{$status==1?'active':''}} ">未支付</a></li>
                           <li><a href="{{URL::route('merchants.orders',array('leader_id'=>base64_encode($leader->id),'status'=>2))}}" class="{{$status==2?'active':''}}">已支付</a></li>
                           <li><a href="{{URL::route('merchants.orders',array('leader_id'=>base64_encode($leader->id),'status'=>9))}}" class="{{$status==9?'active':''}}">已分润</a></li>
                       </ul>
                  </div>
              </div>
              @foreach($orders as $order)
                  @include('merchants/order/_order',array('order'=>$order,'list'=>true))
              @endforeach
              {{--<div class="product-list addproduct orderlist">--}}
                  {{--<div class="list-top">--}}
                      {{--<div class="lf-img"><img src="/assets/images/tu01.jpg"></div>--}}
                       {{--<div class="lr-word">--}}
                         {{--<div class="name-time">--}}
                           {{--<div class="name">优理氏粉丝</div>--}}
                           {{--<div class="time">14-12-28 18:26</div>--}}
                         {{--</div>--}}
                       {{--</div>--}}
                  {{--</div><!-- 头部 -->--}}
                   {{--<ul class="pl-ul">--}}
                       {{--<li>--}}
                          {{--<div class="limg"><img src="/assets/images/tu03.jpg"></div>--}}
                          {{--<div class="liword">--}}
                              {{--<div class="title">UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液</div>--}}
                              {{--<div class="market-price">￥58.00</div>--}}
                              {{--<div class="repertory split">可分润:<span>￥58.00</span></div>--}}
                              {{--<div class="count">x 1</div>--}}
                          {{--</div>--}}
                       {{--</li>--}}
                       {{--<li class="last">--}}
                          {{--<div class="limg"><img src="/assets/images/tu03.jpg"></div>--}}
                          {{--<div class="liword">--}}
                              {{--<div class="title">UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液</div>--}}
                              {{--<div class="market-price">￥58.00</div>--}}
                              {{--<div class="repertory split">可分润:<span>￥58.00</span></div>--}}
                              {{--<div class="count">x 1</div>--}}
                          {{--</div>--}}
                       {{--</li>--}}
                   {{--</ul><!-- 产品 -->--}}
                   {{--<div class="statistics-price">--}}
                      {{--<div class="product-num">2件商品</div>--}}
                      {{--<div class="actual-pay">实付:<span>￥346.00</span></div>--}}
                      {{--<div class="splitting-money">分润:<span>￥146.00</span></div>--}}
                   {{--</div><!-- 统计价格 -->--}}
                   {{--<div class="pay-state">--}}
                       {{--<div class="paybutton01">--}}
                         {{--已支付--}}
                       {{--</div>--}}

                   {{--</div><!-- 支付状态 -->--}}
              {{--</div><!-- 订单一 -->--}}

              {{--<div class="product-list addproduct orderlist">--}}
                  {{--<div class="list-top">--}}
                      {{--<div class="lf-img"><img src="/assets/images/tu01.jpg"></div>--}}
                       {{--<div class="lr-word">--}}
                         {{--<div class="name-time">--}}
                           {{--<div class="name">优理氏粉丝</div>--}}
                           {{--<div class="time">14-12-28 18:26</div>--}}
                         {{--</div>--}}
                       {{--</div>--}}
                  {{--</div><!-- 头部 -->--}}
                   {{--<ul class="pl-ul">--}}
                       {{--<li>--}}
                          {{--<div class="limg"><img src="/assets/images/tu03.jpg"></div>--}}
                          {{--<div class="liword">--}}
                              {{--<div class="title">UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液</div>--}}
                              {{--<div class="market-price">￥58.00</div>--}}
                              {{--<div class="repertory split">可分润:<span>￥58.00</span></div>--}}
                              {{--<div class="count">x 1</div>--}}
                          {{--</div>--}}
                       {{--</li>--}}
                       {{--<li class="last">--}}
                          {{--<div class="limg"><img src="/assets/images/tu03.jpg"></div>--}}
                          {{--<div class="liword">--}}
                              {{--<div class="title">UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液</div>--}}
                              {{--<div class="market-price">￥58.00</div>--}}
                              {{--<div class="repertory split">可分润:<span>￥58.00</span></div>--}}
                              {{--<div class="count">x 1</div>--}}
                          {{--</div>--}}
                       {{--</li>--}}
                   {{--</ul><!-- 产品 -->--}}
                   {{--<div class="statistics-price">--}}
                      {{--<div class="product-num">2件商品</div>--}}
                      {{--<div class="actual-pay">实付:<span>￥346.00</span></div>--}}
                      {{--<div class="splitting-money">分润:<span>￥146.00</span></div>--}}
                   {{--</div><!-- 统计价格 -->--}}
                   {{--<div class="pay-state">--}}
                       {{--<div class="paybutton02">--}}
                         {{--未支付--}}
                       {{--</div>--}}

                   {{--</div><!-- 支付状态 -->--}}
              {{--</div><!-- 订单二 -->--}}

              {{--<div class="product-list addproduct orderlist">--}}
                  {{--<div class="list-top">--}}
                      {{--<div class="lf-img"><img src="/assets/images/tu01.jpg"></div>--}}
                       {{--<div class="lr-word">--}}
                         {{--<div class="name-time">--}}
                           {{--<div class="name">优理氏粉丝</div>--}}
                           {{--<div class="time">14-12-28 18:26</div>--}}
                         {{--</div>--}}
                       {{--</div>--}}
                  {{--</div><!-- 头部 -->--}}
                   {{--<ul class="pl-ul">--}}
                       {{--<li>--}}
                          {{--<div class="limg"><img src="/assets/images/tu03.jpg"></div>--}}
                          {{--<div class="liword">--}}
                              {{--<div class="title">UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液</div>--}}
                              {{--<div class="market-price">￥58.00</div>--}}
                              {{--<div class="repertory split">可分润:<span>￥58.00</span></div>--}}
                              {{--<div class="count">x 1</div>--}}
                          {{--</div>--}}
                       {{--</li>--}}
                       {{--<li class="last">--}}
                          {{--<div class="limg"><img src="/assets/images/tu03.jpg"></div>--}}
                          {{--<div class="liword">--}}
                              {{--<div class="title">UNES优理氏玻尿酸原液 玻尿酸肽原液深层保湿面部精华补水精华液</div>--}}
                              {{--<div class="market-price">￥58.00</div>--}}
                              {{--<div class="repertory split">可分润:<span>￥58.00</span></div>--}}
                              {{--<div class="count">x 1</div>--}}
                          {{--</div>--}}
                       {{--</li>--}}
                   {{--</ul><!-- 产品 -->--}}
                   {{--<div class="statistics-price">--}}
                      {{--<div class="product-num">2件商品</div>--}}
                      {{--<div class="actual-pay">实付:<span>￥346.00</span></div>--}}
                      {{--<div class="splitting-money">分润:<span>￥146.00</span></div>--}}
                   {{--</div><!-- 统计价格 -->--}}
                   {{--<div class="pay-state">--}}
                       {{--<div class="paybutton03">--}}
                         {{--已分润--}}
                       {{--</div>--}}

                   {{--</div><!-- 支付状态 -->--}}
              {{--</div><!-- 订单三 -->--}}

            {{--</section>--}}
            <!-- content -->
        </div>
    </div>
@stop