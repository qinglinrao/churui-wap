@extends('public.template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">

            <section class="header">
                <div class="htitle common">财务管理</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
{{--                <a href="{{URL::route('merchants.account.apply')}}" class="hright">申请提现</a>--}}
            </section><!-- 头部 -->

            <section class="content">

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

            </section>
            <!-- content -->
        </div>
    </div>
@stop