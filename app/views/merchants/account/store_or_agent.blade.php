@extends('public.template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">

            <section class="header">
                <div class="htitle common">财务管理</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
                {{--<a href="{{URL::route('merchants.account.apply')}}" class="hright">申请提现</a>--}}
            </section><!-- 头部 -->

            <section class="content">
               <div class="remaining-sum">
                   <div class="rs-left">
                      <div class="rsw-title">账户余额（元）</div>
                      <div class="rsw-p1">{{AppHelper::money($merchant->money)}}</div>
                  </div>
                  <div class="rs-right">
                      <div class="rsw-title">累计收入（元）</div>
                      <div class="rsw-p1">{{AppHelper::money($merchant->total_profit)}}</div>
                  </div>
               </div><!-- 用户数据 -->




               <div class="rowblock">
                   <div class="store-top-box noborder">
                       <div class="store-top">
                           <div class="shopsplitnum">
                             <div class="sp-standard">店铺分润<br>（元）</div>
                             <div class="sp-num">{{AppHelper::money($merchant->shop_profit)}}</div>
                           </div>
                           <div class="arrow"></div>

                       </div>

                    <div class="usr-sell-data">
                         <div class="ud-box">
                             <div class="udrow left line-right">
                                <a href="#">
                                 <p class="p1">{{AppHelper::money($merchant->total_pay)}}</p>
                                 <p class="p2">销售额</p>
                                </a>
                             </div>
                             <div class="udrow left">
                                <a href="#">
                                 <p class="p1">{{$merchant->order_num}}</p>
                                 <p class="p2">订单</p>
                                </a>
                             </div>
                             <div class="udrow right line-left">
                                <a href="#">
                                 <p class="p1">{{$merchant->customer_num}}</p>
                                 <p class="p2">我的客户</p>
                                </a>
                             </div>
                         </div>
                   </div><!-- 用户数据 -->
                   </div>
               </div>

               <div class="rowblock">
                   <div class="store-top-box noborder">
                       <div class="store-top">
                           <div class="shopsplitnum">
                             <div class="sp-standard">{{get_follow_link_name($merchant->merchant_grade+1)}}分润<br>（元）</div>
                             <div class="sp-num">{{AppHelper::money($followers->sum('leader_profit'))}}</div>
                           </div>
                           <div class="arrow"></div>

                       </div>

                    <div class="usr-sell-data">
                         <div class="ud-box">
                             <div class="udrow left line-right">
                                <a href="#">
                                 <p class="p1">{{AppHelper::money($followers->sum('total_pay'))}}</p>
                                 <p class="p2">销售额</p>
                                </a>
                             </div>
                             <div class="udrow left">
                                <a href="#">
                                 <p class="p1">{{$followers->sum('order_num')}}</p>
                                 <p class="p2">订单</p>
                                </a>
                             </div>
                             <div class="udrow right line-left">
                                <a href="{{URL::route('merchants.follower.list',array('leader_id'=>base64_encode($merchant->id)))}}">
                                 <p class="p1">{{$followers->count()}}</p>
                                 <p class="p2">{{get_follow_link_name($merchant->merchant_grade+1,false)}}</p>
                                </a>
                             </div>
                         </div>
                   </div><!-- 用户数据 -->
                   </div>
               </div>

               <div class="rowblock">
                  <a href="{{URL::route('merchants.account.list')}}">
                   <div class="evticon">

                        <div class="etleft">
                         提现记录
                        </div>
                        <div class="etarrow">
                        </div>
                   </div>
                  </a>
                </div>

            </section>
            <!-- content -->

        </div>
    </div>
@stop