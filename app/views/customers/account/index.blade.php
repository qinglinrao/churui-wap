@extends('public.html')

@section('wrapper')
    {{Form::open(array('action'=>'AccountController@postEdit'))}}
    <div class="top">
        <ul>
            <li class="back-arrow"><a href="javascript:history.go(-1)"><img src="/assets/images/churui/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">账户信息</li>
            <li class="forward"><input type="submit" value="确定" style="background-color: #fff;border:none; cursor:pointer;"/></li>
        </ul>
    </div>


    <div  class="content">
        <div  class="zfb">
            <div  class="zfb-zh">
                <span class="item">支付宝账号</span>
                <span class="value">
                    @if(isset($account->alipay_account))
                        {{ Form::text('alipay_account', $account->alipay_account, array('style'=>'border: none;text-align: right;'))}}
                    @else
                        {{ Form::text('alipay_account', '', array('style'=>'border: none;text-align: right;', 'placeholder'=>'请输入支付宝账号'))}}
                    @endif
                </span>
            </div>
            <div  class="zfb-xm">
                <span class="item">支付宝姓名</span>
                <span class="value">
                    @if(isset($account->alipay_name))
                        {{ Form::text('alipay_name', $account->alipay_name, array('style'=>'border: none;text-align: right;'))}}
                    @else
                        {{ Form::text('alipay_name', '', array('style'=>'border: none;text-align: right;', 'placeholder'=>'请输入支付宝姓名'))}}
                    @endif
                </span>
            </div>
        </div>
        <div  class="zh-xinxi">
            <div  class="txzh">
                <span class="item">提现账户</span>
                <span class="value">
                    @if(isset($account->cash_account))
                        {{ Form::text('cash_account', $account->cash_account, array('style'=>'border: none;text-align: right;'))}}
                    @else
                        {{ Form::text('cash_account', '', array('style'=>'border: none;text-align: right;', 'placeholder'=>'请输入提现账户'))}}
                    @endif
                </span>
            </div>
            <div  class="huzhu">
                <span class="item">户主</span>
                <span class="value">
                    @if(isset($account->cash_name))
                        {{ Form::text('cash_name', $account->cash_name, array('style'=>'border: none;text-align: right;'))}}
                    @else
                        {{ Form::text('cash_name', '', array('style'=>'border: none;text-align: right;', 'placeholder'=>'请输入户主名称'))}}
                    @endif
                </span>
            </div>
            <div  class="kh-bank">
                <span class="item">开户银行</span>
                <span class="value">
                    @if(isset($account->bank_name))
                        {{ Form::text('bank_name', $account->bank_name, array('style'=>'border: none;text-align: right;'))}}
                    @else
                        {{ Form::text('bank_name', '', array('style'=>'border: none;text-align: right;', 'placeholder'=>'请输入开户银行名称'))}}
                    @endif
                </span>
            </div>
            <div  class="sfz">
                <p>身份证</p>
                @if(isset($account->front_image->url))
                {{AppHelper::img($account->front_image->url,$account->front_image->alt,array('width'=>'25%', 'height'=>'25%', 'border'=>0))}}
                <input type="hidden" name="photo1" value="{{$account->front_image->id}}">
                @else
                    <input id="photo-upload" type="file" name="photo1" multiple>
                    <div id="photo-warp">
                    </div>
                @endif

                @if(isset($account->back_image->url))
                {{AppHelper::img($account->back_image->url,$account->front_image->alt,array('width'=>'25%', 'height'=>'25%', 'border'=>0))}}
                <input type="hidden" name="photo2" value="{{$account->back_image->id}}">
                @else
                   <input id="photo-upload2" type="file" name="photo2" multiple>
                    <div id="photo-warp2">
                    </div>
                @endif
            </div>
        </div>
    </div>
    {{ Form::close() }}
@section('scripts')
    @parent
    <script type="text/javascript">
        $(document).ready(function(){

        });
    </script>

@stop
@stop