@extends('public/template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">

            <section class="header">
                <div class="htitle common">{{$merchant->username}}</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
            </section><!-- 头部 -->

            <section class="content">
               <div class="remaining-sum">
                   <div class="rsw-title">{{get_owner_merchant_name($merchant)}}的佣金（元）</div>
                  <div class="rsw-p1">{{AppHelper::money($merchant->total_profit)}}</div>
               </div>
               <div class="usr-sell-data unboder">
                     <div class="ud-box">
                         <div class="udrow left line-right">
                            <a href="#">
                             <p class="p1">{{AppHelper::money($merchant->total_pay)}}</p>
                             <p class="p2">销售额</p>
                            </a>
                         </div>
                         <div class="udrow left">
                            {{--<a href="{{URL::route('merchants.orders',array('leader_id'=>base64_encode($merchant->id)))}}">--}}
                            <a href="#">
                             <p class="p1">{{$merchant->order_num}}</p>
                             <p class="p2">订单</p>
                            </a>
                         </div>
                         <div class="udrow right line-left">
                            {{--<a href="{{URL::route('merchants.customers',array('leader_id'=>base64_encode($merchant->id)))}}">--}}
                            <a href="#">
                             <p class="p1">{{$merchant->customers->count()}}</p>
                             {{--<p class="p2">{{get_owner_merchant_name($merchant)}}的客户</p>--}}
                             <p class="p2">客户</p>
                            </a>
                         </div>
                     </div>
               </div><!-- 用户数据 -->



               <div class="rowblock">
                   <div class="store-top-box shopsplitting mdnone">
                       <div class="store-top">
                          {{--<a href="{{URL::route($merchant->merchant_grade == 3?'merchants.customers':'merchants.follower.list',array('leader_id'=>base64_encode($merchant->id)))}}">--}}
                          <a href="#">
                           <div class="storepic">
                               <img src="{{$merchant->image?AppHelper::imgSrc($merchant->image->url):'/assets/images/tu01.jpg'}}">
                           </div>
                           <div class="word">
                                <div class="wcoc store-name">{{$merchant->username}}</div>
                                {{--<div class="wcoc seeba">查看{{get_follow_link_name($merchant->merchant_grade+1)}}</div>--}}
                           </div>
                           <div class="arrow"></div>
                          </a>
                       </div>
                   </div><!-- 我的店铺头部信息 -->

                    <div class="user-mess">
                      <div class="um-row">
                        <div class="ur-left">姓名</div>
                        <div class="ur-right">{{$merchant->real_name}}</div>
                      </div>

                      <div class="um-row last">
                        <div class="ur-left">手机号</div>
                        <div class="ur-right">{{$merchant->mobile}}</div>
                      </div>

                      {{--<div class="um-row last">--}}
                        {{--<div class="ur-left">身份证号</div>--}}
                        {{--<div class="ur-right">{{$merchant->identity_num}}</div>--}}
                      {{--</div>--}}

                     </div>
               </div>

               <div class="control-store">
                 @if($merchant->status == 2)
                 <a onclick="return confirm('您确定要冻结账户吗?')" href="{{URL::route('merchants.follower.change_status',array('merchant_id'=>base64_encode($merchant->id),'status'=>3))}}" class="button left">冻结{{get_follow_link_name($merchant->merchant_grade)}}</a>
                 @elseif($merchant->status == 3)
                 <a  href="{{URL::route('merchants.follower.change_status',array('merchant_id'=>base64_encode($merchant->id),'status'=>2))}}" class="button left noaction">解除冻结</a>
                 @endif
                 <a onclick="return confirm('您确定要删除账户吗?')" href="{{URL::route('merchants.follower.delete',array('id'=>base64_encode($merchant->id)))}}" class="button right">删除{{get_follow_link_name($merchant->merchant_grade)}}</a>
               </div>

            </section>
            <!-- content -->



        </div>
    </div>
@stop