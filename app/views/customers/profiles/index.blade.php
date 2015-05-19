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
        <div  class="head-bg">
            <div  class="head-photo">
                <img src="/assets/images/churui/touxiang.jpg" width="100%" height="100%" border="0" alt="头像">
            </div>
            <div  class="name">
                <p>阿甘</p>
            </div>
            <div  class="phone">
                <p>18597483819</p>
            </div>
        </div>

        <div  class="gr-detailed">
            <div  class="gr-member">
                <a href="{{ URL::route('agent.my_members') }}" >
                    <span class="gr-item">我的会员</span>
                    <span class="gr-value">5</span>
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
                    <span class="gr-value">￥14500.00</span>
                </a>
            </div>
        </div>
        <a href="#"><div  class="gr-tixian">申请提现</div>	</a>
    </div>
@stop