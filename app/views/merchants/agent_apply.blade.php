@extends('public.template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">
            <p class="form-tip">{{$errors->first()}}</p>
            <section class="header">
                <div class="htitle common">代理商加盟</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
            </section><!-- 头部 -->

            <section class="content">
               <div class="join-inform">
                  {{Form::open(array('url'=>URL::route('merchants.deal_agent_apply')))}}
                   <div class="inform-row">
                     {{Form::text('merchant[mobile]',null,array('placeholder'=>'请输入11位数手机号'))}}
                   </div>
                   <div class="inform-row">
                    {{Form::password('merchant[password]',array('placeholder'=>'请输密码,6~10位长度的字母或数字'))}}
                   </div>
                   <div class="inform-row">
                    {{Form::text('merchant[weixin]',null,array('placeholder'=>'请输入您的微信号'))}}
                   </div>
                   <div class="inform-row">
                    {{Form::text('merchant[company]',null,array('placeholder'=>'请输入公司名称'))}}
                   </div>


                   <div class="inform-row">
                    {{Form::text('merchant[real_name]',null,array('placeholder'=>'请输入负责人姓名,2～4位纯汉字'))}}
                   </div>
                   <div class="inform-row">
                    {{Form::text('merchant[responsible_area]',null,array('placeholder'=>'填写区域，例如：广东省广州市'))}}
                  </div>

                  <div class="responsible_area">
                     <ul >
                        <li class="choose"><b>选择负责区域(可选6个)</b><span>+</span></li>

                     </ul>

                  </div>
                   {{--<div class="inform-row">--}}
                     {{--{{Form::text('merchant[identity_num]',null,array('placeholder'=>'请输入身份证号'))}}--}}
                   {{--</div>--}}
                   <div class="inform-submit">
                     <input type="submit" value="提交申请">
                   </div>
                  {{Form::close()}}
               </div>

            </section>
            <!-- content -->



        </div>
    </div>
 <div class="over-layer" style="display: none;"></div>
    <div class="region_list">
        <h4><b>选择负责区域</b><button class="close_window">X</button></h4>
        <ul class="title">
            <li class="cur">省份</li>
            <li>城市</li>
            <li>地区</li>
        </ul>
        <ul class="regions">
            @foreach($regions as $region)
            <li region_grade="1" region_id="{{$region->id}}" province_id="{{$region->province_id}}" city_id="{{$region->city_id}}" district_id="{{$region->district_id}}">{{$region->name}}</li>
            @endforeach
            {{--<li>广东</li>--}}
            {{--<li>上海</li>--}}

            {{--<li>北京</li>--}}
            {{--<li>重庆</li>--}}

            {{--<li>西藏</li>--}}
        </ul>
        <div>

        </div>


    </div>
@stop