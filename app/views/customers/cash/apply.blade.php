@extends('public.html')

@section('wrapper')
    <div class="top">
        <ul>
            <li class="back-arrow"><a href="javascript:history.go(-1)"><img src="/assets/images/churui/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">申请提现</li>
            <li class="forward"><a href="{{ URL::route('account.index') }}" >账户信息</a></li>
        </ul>
    </div>


    <div  class="content">

        {{Form::open(['url'=>URL::route('cash.apply')])}}
        <div  class="sum-money">
            <p class="sq-wenzi">我的佣金（元）</p>
            <p class="shuzi">{{ $customer->money }}</p>
            {{Form::hidden('customer_id',$customer->id)}}
        </div>
        <p style="color: red;font-size: 12px;">{{$errors->first()}}</p>
        <div  class="tx-money">
            <span class="wenzi">提现金额</span>
            <span class="shuzi">{{Form::text('money',null,['placeholder'=>$customer->money,'style'=>'border:none;'])}}</span>
        </div>
        <div  class="tixian">
            <p><input type="submit" style="background-color:#6ba78d;border:none;color:#fff;" value="提现"/></p>

        </div>
        {{Form::close()}}

    </div>
@stop