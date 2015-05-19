@extends('public/template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">
            <section class="header">
                <div class="htitle companyt">UNES</div>
            </section><!-- 头部 -->


            <section class="usr-mess">
                 <div class="noblock"></div>
                 <div class="head-portrait"><a href="#"><img src="{{$merchant->image?AppHelper::imgSrc($merchant->image->url):'/assets/images/tu01.jpg'}}"></a></div><!-- 头像 -->
                 <div class="sex-name">

                    {{$merchant->username}}[{{get_follow_link_name($merchant->merchant_grade)}}]<br>
                        {{$merchant->responsible_area}}
                 </div>
                 <div class="usr-data">
                     <div class="ud-box">
                         <div class="ud-bg"></div>
                         <div class="udrow left line-right">
                            <a href="#">
                             <p class="p1">{{AppHelper::money($merchant->total_pay)}}</p>
                             <p class="p2">销售额</p>
                            </a>
                         </div>
                         <div class="udrow left">
                            <a href="{{URL::route('merchants.orders')}}">
                             <p class="p1">{{$merchant->order_num}}</p>
                             <p class="p2">订单</p>
                            </a>
                         </div>
                         <div class="udrow right line-left">
                            <a href="{{URL::route('merchants.customers')}}">
                             <p class="p1">{{$merchant->customer_num}}</p>
                             <p class="p2">我的客户</p>
                            </a>
                         </div>
                     </div>
                 </div>
            </section><!-- 用户信息 -->


            <section class="content">
               <div class="home-category">

                 <div class="hc-block cl1">
                      @if($merchant->merchant_grade > 1)
                      <a href="{{URL::route('merchants.shop')}}">
                           <div class="hcicon"></div>
                           <div class="word">我的店铺</div>
                      </a>
                      @else
                      <a href="{{URL::route('merchants.customers')}}">
                           <div class="hcicon"></div>
                           <div class="word">我的客户</div>
                      </a>
                      @endif

                 </div>

                 <div class="hc-block cl2">
                       <a href="{{URL::route('merchants.account')}}">
                           <div class="hcicon"></div>
                           <div class="word">财务管理</div>
                       </a>
                 </div>

                 @if($merchant->merchant_grade == 3)
                 <div class="hc-block cl3">
                     <a href="{{URL::route('merchants.orders')}}">
                       <div class="hcicon"></div>
                       <div class="word">我的订单</div>
                     </a>
                 </div>
                 @else
                <div class="hc-block cl5">
                     <a href="{{URL::route('merchants.follower.manage')}}">
                       <div class="hcicon"></div>
                       <div class="word">{{$merchant->merchant_grade == 2?'BA管理':'门店管理'}}</div>
                     </a>
                 </div>
                 @endif

                 <div class="hc-block cl4">
                     <a href="{{URL::route('merchants.info')}}">
                       <div class="hcicon"></div>
                       <div class="word">个人中心</div>
                     </a>
                 </div>

               </div>
            </section>
            <!-- content -->



        </div>
    </div>
@stop