@extends('public.html')

@section('wrapper')
    <div class="top">
        <ul>
            <li class="back-arrow"><a href="javascript:history.go(-1)"><img src="/assets/images/churui/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">提现记录</li>
            <li class="forward"><a href="{{ URL::route('cash.apply') }}">申请提现</a></li>
        </ul>
    </div>


    <div  class="content">
        <div  class="sum-money">
            <div class="yu-e">
                <p class="wenzi">账户余额（元）</p>
                <p class="shuzi">{{ $customer->money }}</p>
            </div>
            <div class="leiji">
                <p class="wenzi">累计收入（元）</p>
                <p class="shuzi">{{ $customer->total_profit }}</p>
            </div>
        </div>
        <div  class="tixian-lists">
            @foreach($logs as $log)
            <div  class="tx-list">
                <div  class="list">
                    <p class="tx-wenzi">提现{{ $log->money }}元</p>
                    <p class="tx-time">{{$log->created_at->format('y-m-d H:i')}}</p>
                </div>
                <div class="tx-jieguo" >
                    <p class="jieguo1">{{get_account_log_status($log->status)}}</p>
                </div>
            </div>
            @endforeach
        </div>
    </div>
@stop