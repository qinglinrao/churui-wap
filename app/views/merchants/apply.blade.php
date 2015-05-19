@extends('public.template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">
            <p class="form-tip">{{$errors->first()}}</p>
            <section class="header">
                <div class="htitle common">申请加盟</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
            </section><!-- 头部 -->

            <section class="content">
               <div class="join-inform">
                  {{Form::open(array('url'=>URL::route('merchants.deal_apply_join')))}}
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
                      {{Form::text('merchant[age]',null,array('placeholder'=>'请输入年龄'))}}
                   </div>
                   <div class="inform-row">
                       <div class="skin-flat">
                           {{Form::radio('merchant[sex]',1,true,array('class'=>'inputtext','id'=>'sex-male-radio'))}} <label for="sex-male-radio">男</label>
                           {{Form::radio('merchant[sex]',0,false,array('class'=>'inputtext','id'=>'sex-female-radio'))}}<label for="sex-female-radio">女</label>
                       </div>
                   </div>
                   {{--<div class="inform-row">--}}
                     {{--{{Form::text('merchant[identity_num]',null,array('placeholder'=>'请输入身份证号'))}}--}}
                   {{--</div>--}}
                   <div class="inform-submit">
                     {{Form::hidden('merchant[MID]',$MID)}}
                     <input type="submit" value="提交申请">
                   </div>
                  {{Form::close()}}
               </div>

            </section>
            <!-- content -->



        </div>
    </div>
@stop