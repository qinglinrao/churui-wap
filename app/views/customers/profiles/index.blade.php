@extends('public.html')

@section('wrapper')

    <div class="top">
        <ul>
            <li class="back-arrow"><a href="#"><img src="/assets/images/churui/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">个人中心</li>
            <li class="forward"><a href="#" ></a></li>
        </ul>
    </div>


    <div  class="content">
        @if($auth_checked)
        <div  class="head-bg">
            <div  class="head-photo">
                <img src="{{$customer->detail &&$customer->detail->image?AppHelper::imgSrc($customer->detail->image->url):'/assets/images/prod_thumb.png'}}" width="100%" height="100%" border="0" alt="头像">
            </div>
            <div  class="name">
                <p>{{$customer->detail->username}}</p>
            </div>
            <div  class="phone">
                <p>{{$customer->mobile}}</p>
            </div>
        </div>
        @endif

        <div  class="gr-detailed">
            <div  class="gr-member">
                <a href="{{ URL::route('agent.my_members') }}" >
                    <span class="gr-item">我的会员</span>
                    <span class="gr-value">{{$customer->customer_num}}</span>
                </a>
            </div>

            <div  class="gr-dingdan">
                <a href="{{ URL::route('agent.order_lists') }}" >
                    <span class="gr-item">订单总数</span>
                    <span class="gr-value">10</span>
                </a>
            </div>

            <div  class="gr-ticheng">
                <a href="{{ URL::route('agent.index') }}" >
                    <span class="gr-item">代理提成</span>
                    <span class="gr-value">￥{{AppHelper::money($customer->total_pay)}}</span>
                </a>
            </div>
        </div>
        <a href="{{ URL::route('cash.apply') }}"><div  class="gr-tixian">申请提现</div>	</a>
    </div>
@stop