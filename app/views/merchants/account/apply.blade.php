@extends('public.template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">

            <section class="header">
                <div class="htitle common">财务管理</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
                <a href="{{URL::route('merchants.account.show')}}" class="hright">账户信息</a>
            </section><!-- 头部 -->

            <section class="content">
               <div class="remaining-sum">

                       <div class="rsw-title">账户余额（元）</div>
                       <div class="rsw-p1">{{AppHelper::money($merchant->money)}}</div>
               </div>

               <div class="withdrawform">
                 {{Form::open(array('url'=>URL::route('merchants.account.apply')))}}
                    <p class="form-tip">{{$errors->first()}}</p>
                   <div class="wd-input">
                     <div class="wi-left">提现金额</div>
                     <div class="wi-right">{{Form::text('money',null,array('placeholder'=>"请输入提现金额",'autocomplete'=>'off'))}}</div>
                   </div>
                   <div class="wd-submit"><input type="submit" value="提现"></div>
                  {{Form::close()}}
               </div>







            </section>
            <!-- content -->



        </div>
    </div>
@stop