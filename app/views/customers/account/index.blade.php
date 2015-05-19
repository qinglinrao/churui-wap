@extends('public.html')

@section('wrapper')
    <div class="top">
        <ul>
            <li class="back-arrow"><a href="javascript:history.go(-1)"><img src="/assets/images/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">账户信息</li>
            <li class="forward"><a href="javascript:history.go(-1)" >确定</a></li>
        </ul>
    </div>


    <div  class="content">
        <div  class="zfb">
            <div  class="zfb-zh">
                <span class="item">支付宝账号</span>
                <span class="value">{{ $account->alipay_account }}</span>
            </div>
            <div  class="zfb-xm">
                <span class="item">支付宝姓名</span>
                <span class="value">{{ $account->alipay_name }}</span>
            </div>
        </div>
        <div  class="zh-xinxi">
            <div  class="txzh">
                <span class="item">提现账户</span>
                <span class="value">{{ $account->cash_account }}</span>
            </div>
            <div  class="huzhu">
                <span class="item">户主</span>
                <span class="value">{{ $account->cash_name }}</span>
            </div>
            <div  class="kh-bank">
                <span class="item">开户银行</span>
                <span class="value">{{ $account->bank_name }}</span>
            </div>
            <div  class="sfz">
                <p>身份证</p>
                {{AppHelper::img($account->front_image->url,$account->front_image->alt,array('width'=>'25%', 'height'=>'25%', 'border'=>0))}}
                {{AppHelper::img($account->back_image->url,$account->front_image->alt,array('width'=>'25%', 'height'=>'25%', 'border'=>0))}}
            </div>
        </div>
    </div>
@stop