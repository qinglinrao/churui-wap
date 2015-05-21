@extends('public.html')

@section('wrapper')
    <div class="top">
        <ul>
            <li class="back-arrow"><a href="javascript:history.go(-1)"><img src="/assets/images/churui/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">@if($id ==1 )我的会员 @elseif($id == 2)我的第三级会员 @else 我的第四级会员@endif</li>
            <li class="forward"><a href="#" ></a></li>
        </ul>
    </div>


    <div  class="content">

        @foreach($next_agents as $agent)
        <div  class="hy-list">
            <div  class="head-photo">
                <img src="/assets/images/churui/member1.jpg" width="100%" height="100%" border="0" alt="会员头像">
            </div>
            <p class="hy-name">{{ $agent->detail->username }}</p>
            <p class="hy-tel">{{ $agent->mobile }}</p>
            <p class="hy-num">他的会员：<span class="num">{{ $agent->customer_num }}</span></p>
        </div>
        @endforeach


    </div>
@stop