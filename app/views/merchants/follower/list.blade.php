@extends('public/template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">
            <section class="header">
                <div class="htitle common">{{get_owner_merchant_name($leader)}}的{{get_follow_link_name($leader->merchant_grade+1)}}</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
            </section><!-- 头部 -->

            <section class="content">
              <div class="myorder-top">
                  <div class="mt-category">
                      <ul class="mt-ul">
                           <li><a href="{{URL::route('merchants.follower.list',array('leader_id'=>base64_encode($leader->id)))}}" class="{{$sort=='created_at'?'active':''}}">时间</a></li>
                           <li><a href="{{URL::route('merchants.follower.list',array('leader_id'=>base64_encode($leader->id),'sort'=>'total_pay'))}}" class="{{$sort=='total_pay'?'active':''}}">销售额</a></li>
                           <li><a href="{{URL::route('merchants.follower.list',array('leader_id'=>base64_encode($leader->id),'sort'=>'order_num'))}}" class="{{$sort=='order_num'?'active':''}}">订单</a></li>
                           <li><a href="{{URL::route('merchants.follower.list',array('leader_id'=>base64_encode($leader->id),'sort'=>'leader_profit'))}}" class="{{$sort=='leader_profit'?'active':''}}">佣金</a></li>
                       </ul>
                  </div>
              </div>

              @foreach($merchants as $merchant)
              <div class="splited">
                <div class="store-top-box shopsplitting">
                     <div class="store-top">
                        <a href="{{URL::route('merchants.follower.detail',array('id'=>$merchant->id))}}">
                         <div class="storepic">
                             <img src="{{$merchant->image?AppHelper::imgSrc($merchant->image->url):'/assets/images/tu01.jpg'}}">
                         </div>
                         <div class="word">
                              <div class="wcoc store-name">{{$merchant->username}}</div>
                              <div class="wcoc time"> {{$merchant->created_at->format('Y-m-d')}}</div>
                         </div>
                         <div class="arrow"></div>
                        </a>
                     </div>
                </div><!-- 我的店铺头部信息 -->
                <div class="usr-sell-data unboder datasplitting">
                       <div class="ud-box">
                           <div class="udrow left line-right">
                              <a href="#">
                               <p class="p1">{{AppHelper::money($merchant->total_pay)}}</p>
                               <p class="p2">销售额(元)</p>
                              </a>
                           </div>
                           <div class="udrow left line-right">
                              {{--<a href="{{URL::route($merchant->merchant_grade == 3?'merchants.customers':'merchants.follower.list',array('leader_id'=>base64_encode($merchant->id)))}}">--}}
                              <a href="#">
                               <p class="p1">{{$merchant->follower_num}}</p>
                               <p class="p2">{{get_follow_link_name($merchant->merchant_grade+1)}}</p>
                              </a>
                           </div>
                           <div class="udrow left line-right">
                              {{--<a href="{{URL::route('merchants.orders',array('leader_id'=>base64_encode($merchant->id)))}}">--}}
                              <a href="#">
                               <p class="p1">{{$merchant->order_num}}</p>
                               <p class="p2">订单</p>
                              </a>
                           </div>
                           <div class="udrow left">
                              <a href="#">
                               <p class="p1">{{$merchant->leader_profit}}</p>
                               <p class="p2">佣金(元)</p>
                              </a>
                           </div>
                       </div>
                </div><!-- 用户数据 -->
               </div>
               @endforeach



            </section>
            <!-- content -->



        </div>
    </div>
@stop