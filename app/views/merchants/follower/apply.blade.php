@extends('public/template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">

            <section class="header">
                <div class="htitle common">入驻审核</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
            </section><!-- 头部 -->

            <section class="content">
               @foreach($merchants as $merchant)
               <div class="check-block">
                   <div class="cb-time">{{$merchant->created_at->format('y-m-d H:i')}}</div>
                   <div class="cb-content">
                     <div class="cbcbox">
                        <div class="cbrow"><span class="span1">姓名：</span><span>{{$merchant->real_name}}</span></div>
                        <div class="cbrow"><span class="span1">手机号：</span><span>{{$merchant->mobile}}</span></div>
                        {{--<div class="cbrow"><span class="span1">身份证：</span><span>{{$merchant->identity_num}}</span></div>--}}
                        <div class="cbbutton">
                           @if($merchant->status == 1)
                           <div class="button cbbt1"><a href="{{URL::route('merchants.follower.apply_deal',array('merchant_id'=>$merchant->id,'status'=>0))}}" onclick="return confirm('您确定要拒绝?')">拒绝</a> </div>
                           <div class="button cbbt2"><a href="{{URL::route('merchants.follower.apply_deal',array('merchant_id'=>$merchant->id,'status'=>2))}}">同意</a></div>
                           @elseif($merchant->status == 0)
                            <div class="button cbbt3">已拒绝</div>
                           @elseif($merchant->status == 2)
                           <div class="button cbbt3">已同意</div>
                           @elseif($merchant->status == 3)
                           <div class="button cbbt3">已冻结</div>
                           @endif
                         </div>
                     </div>
                   </div>

               </div><!-- 审核 -->
               @endforeach

            </section>
            <!-- content -->



        </div>
    </div>
@stop