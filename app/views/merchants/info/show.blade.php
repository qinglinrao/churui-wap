@extends('public/template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">

            <section class="header">
                <div class="htitle common">个人中心</div>
                <a href="{{URL::route('merchants.home')}}" class="hleft"></a>
                <a href="{{URL::route('merchants.info.edit')}}" class="edit"></a>
            </section><!-- 头部 -->

            <section class="usr-mess pcenter">
                 <div class="noblock"></div>
                 <div class="head-portrait"><a href="#"><img src="{{$merchant->image?AppHelper::imgSrc($merchant->image->url):'/assets/images/tu01.jpg'}}"></a></div><!-- 头像 -->
                 <div class="sex-name">{{$merchant->username}}</div>
            </section><!-- 用户信息 -->

            <section class="content">

            <div class="rowblock">
                  <a href="{{URL::route('merchants.account.show')}}">
                   <div class="evticon pc01">
                        <div class="etleft">
                         提现账户信息
                        </div>
                        <div class="etarrow">
                        </div>
                   </div>
                  </a>

                  <a href="{{URL::route('merchants.info.edit_password')}}">
                   <div class="evticon pc02">
                        <div class="etleft">
                         修改密码
                        </div>
                        <div class="etarrow">
                        </div>
                   </div>
                  </a>

                  <a href="{{URL::route('merchants.info.edit_mobile')}}">
                   <div class="evticon pc03">
                        <div class="etleft">
                         修改绑定手机号
                        </div>
                        <div class="etarrow">
                        </div>
                   </div>
                  </a>
            </div>

            @if($merchant->merchant_grade <=2)
            <div class="rowblock">
                  {{--<a href="{{URL::route('merchants.apply_join',array('MID'=>base64_encode($merchant->id)))}}" id="copy_input" data-val="{{URL::route('merchants.apply_join',array('MID'=>base64_encode($merchant->id)))}}">--}}
                   @if($merchant->merchant_grade == 1)
                    <a href="{{URL::route('merchants.store_apply_join',array('JC'=>base64_encode($merchant->id)))}}" >
                   @else
                    <a href="{{URL::route('merchants.apply_join',array('JC'=>base64_encode($merchant->id)))}}" >
                   @endif
                   {{--<a href="{{URL::route('merchants.apply_join',array('JC'=>base64_encode($merchant->id)))}}" >--}}
                   <div class="evticon pc06">
                        <div class="etleft">
                         邀请加盟
                        </div>
                        <div class="etarrow">
                        </div>
                   </div>
                  </a>
            </div>
            @endif

            <div class="rowblock">
                <a href="{{URL::route('merchants.logout')}}" onclick="return confirm('您确定要退出登录?')">
                  <div class="evticon txc">退出登录</div>
                </a>
            </div>


            </section>
            <!-- content -->



        </div>
    </div>
@stop