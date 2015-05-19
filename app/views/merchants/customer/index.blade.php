@extends('public.template')

@section('wrapper')

	<div class="sunn_wrapper">
        <div id="sunn_main">

            <section class="header">
                <div class="htitle common">{{get_owner_merchant_name($leader)}}的客户</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
            </section><!-- 头部 -->




            <section class="content">
                 <div class="my-clients">
                   <div class="mc-category">
                     <ul class="mc-ul">
                       <li><a href="{{URL::route('merchants.customers',array('leader_id'=>base64_encode($leader->id)))}}" class="{{$sort=='created_at'?'active':''}}">时间</a></li>
                       <li><a href="{{URL::route('merchants.customers',array('leader_id'=>base64_encode($leader->id),'sort'=>'order_total_pay'))}}" class="{{$sort=='order_total_pay'?'active':''}}">消费</a></li>
                       <li><a href="{{URL::route('merchants.customers',array('leader_id'=>base64_encode($leader->id),'sort'=>'order_total_num'))}}" class="{{$sort=='order_total_num'?'active':''}}">订单</a></li>
                       <li><a href="{{URL::route('merchants.customers',array('leader_id'=>base64_encode($leader->id),'sort'=>'leader_profit'))}}" class="{{$sort=='leader_profit'?'active':''}}">分润</a></li>
                     </ul>
                   </div>
                   <ul class="mcc-ul">
                     @foreach($customers as $customer)
                     <li>
                       <div class="lf-img"><img src="{{$customer->detail->image?AppHelper::imgSrc($customer->detail->image->url):'/assets/images/tu01.jpg'}}"></div>
                       <div class="lr-word">
                         <div class="name-time">
                           <div class="name">{{$customer->detail->username}}</div>
                           <div class="time">{{$customer->created_at->format('y-m-d H:i')}}</div>
                         </div>
                         <div class="mun">
                           <span>购买:￥{{$customer->order_total_pay}} </span> <span>订单:{{$customer->order_total_num}} </span> <span>分润:￥{{ $customer->leader_profit }}</span>
                         </div>
                       </div>
                     </li>
                     @endforeach

                   </ul>
                 </div>

            </section>
            <!-- content -->



        </div>
    </div>

@stop