@extends('public.template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">

            <section class="header">
                <div class="htitle common">账户信息</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
                <a href="javascript:void(0)" class="hright" id="save_merchant_account">保存</a>
            </section><!-- 头部 -->

            <section class="content">
               {{Form::open(array('url'=>URL::route('merchants.account.update'),'id'=>'merchant_account'))}}
               {{Form::hidden('id',$account->id)}}
                <p class="form-tip">{{$errors->first()}}</p>
               <div class="rowblock">
                  <div class="user-mess">
                    <div class="um-row">
                      <div class="ur-left">支付宝帐号</div>
                      <div class="ur-right">{{Form::text('alipay_account',$account->alipay_account,array('autocomplete'=>'off','placeholder'=>'请输入支付宝帐号'))}}</div>
                    </div>
                    <div class="um-row">
                      <div class="ur-left">支付宝用户名</div>
                      <div class="ur-right">{{Form::text('alipay_name',$account->alipay_name,array('autocomplete'=>'off','placeholder'=>'请输入支付宝用户名'))}}</div>
                    </div>
                    {{--<div class="um-row">--}}
                      {{--<div class="ur-left">提现账户</div>--}}
                      {{--<div class="ur-right">{{Form::text('bank_account_id',$account->bank_account_id,array('autocomplete'=>'off','placeholder'=>'请输入银行卡号码'))}}</div>--}}
                    {{--</div>--}}

                    {{--<div class="um-row">--}}
                      {{--<div class="ur-left">户主</div>--}}
                      {{--<div class="ur-right">{{Form::text('bank_account_name',$account->bank_account_name,array('autocomplete'=>'off','placeholder'=>'请输入银行卡户主姓名'))}}</div>--}}
                    {{--</div>--}}

                    {{--<div class="um-row">--}}
                      {{--<div class="ur-left">开户银行</div>--}}
                      {{--<div class="ur-right">{{Form::text('bank_name',$account->bank_name,array('autocomplete'=>'off','placeholder'=>'请填写开户银行全称'))}}</div>--}}
                    {{--</div>--}}

                    {{--<div class="um-pic">--}}
                      {{--<div class="up-word">身份证</div>--}}
                      {{--<div class="up-pic">--}}
                        {{--<ul>--}}
                           {{--<li><input type="file" name="identity_up_image_id" id="upload_id_up_image" class="upload_file" /> <img src="{{$account->upImage?AppHelper::imgSrc($account->upImage->url):'/assets/images/tu05.jpg'}}" id="up_image"> </li>--}}
                          {{--<li><input type="file" name="identity_down_image_id" id="upload_id_down_image" class="upload_file" /> <img src="{{$account->downImage?AppHelper::imgSrc($account->downImage->url):'/assets/images/tu06.jpg'}}" id="down_image" ></li>--}}
                        {{--</ul>--}}
                      {{--</div>--}}
                    {{--</div>--}}
                   </div>
               </div>
            </section>
            <!-- content -->
        </div>
    </div>
@stop