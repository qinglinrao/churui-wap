@extends('public.template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">
            <p class="form-tip">{{$errors->first()}}</p>
            <section class="header">
                <div class="htitle common">门店加盟</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
            </section><!-- 头部 -->

            <section class="content">
               <div class="join-inform">
                  <div class="title">您正在申请加盟{{$merchant->company}}({{$merchant->mobile}})的门店...</div>
                  {{Form::open(array('url'=>URL::route('merchants.deal_store_apply')))}}
                   <div class="inform-row">
                     {{Form::text('merchant[mobile]',null,array('placeholder'=>'请输入11位数手机号'))}}
                   </div>
                   <div class="inform-row">
                     {{Form::text('merchant[weixin]',null,array('placeholder'=>'请输入您的微信号'))}}
                   </div>
                   <div class="inform-row">
                    {{Form::text('merchant[real_name]',null,array('placeholder'=>'请输入姓名,2～4位纯汉字'))}}
                   </div>
                   <div class="inform-row">
                       {{Form::text('merchant[shop_name]',null,array('placeholder'=>'请输入您的店铺名称'))}}
                   </div>
                   <div class="inform-row">
                      {{Form::text('merchant[shop_address]',null,array('placeholder'=>'请输入您的店铺地址'))}}
                   </div>
                   <div class="inform-row">
                    {{Form::text('merchant[responsible_area]',null,array('placeholder'=>'填写区域，例如：广东省广州市'))}}
                  </div>
                   {{--<div class="inform-row">--}}
                     {{--{{Form::text('merchant[identity_num]',null,array('placeholder'=>'请输入身份证号'))}}--}}
                   {{--</div>--}}
                   <div class="inform-submit">
                     {{Form::hidden('merchant[MID]',base64_encode($merchant->id))}}
                     <input type="submit" value="提交申请">
                   </div>
                  {{Form::close()}}
                  <div class="title share">请点击微信右上角进行分享</div>
               </div>

            </section>
            <!-- content -->



        </div>
    </div>
@stop