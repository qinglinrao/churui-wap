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
               </div>
               <div class="usr-sell-data unboder">
                     <div class="ud-box">
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
               </div><!-- 用户数据 -->

                @foreach($logs as $log)
                <div class="rowblock">
                   <div class="withdraw">
                        <div class="wdleft">
                             <div class="wdp1">{{account_log_type()[$log->operate_type]}}{{$log->money}}元</div>
                             <div class="wdp2">{{$log->created_at}}</div>

                        </div>
                        <div class="wdright">
                               @if($log->status == 1)
                              <span class="cl01">{{account_log_status()[$log->status]}}</span>
                              @else
                              <span class="cl02">{{account_log_status()[$log->status]}}</span>
                              @endif

                        </div>

                   </div>
                </div>
                @endforeach
                {{--<div class="rowblock">--}}
                   {{--<div class="withdraw">--}}
                        {{--<div class="wdleft">--}}
                             {{--<div class="wdp1">提现1000元</div>--}}
                             {{--<div class="wdp2">14-12-28 18:26</div>--}}

                        {{--</div>--}}
                        {{--<div class="wdright">--}}
                              {{--<span class="cl02">已提现</span>--}}
                        {{--</div>--}}

                   {{--</div><!-- 提现 -->--}}
                {{--</div>--}}

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