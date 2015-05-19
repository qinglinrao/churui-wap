@extends('public/template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">

            <section class="header">
                <div class="htitle common">个人中心</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
                <a href="javascript:void(0)" class="hright" id="update_merchant_info">完成</a>
            </section><!-- 头部 -->


            <section class="content">
                <div class="store-edit">
                   {{Form::open(array('url'=>URL::route('merchants.info.update'),'id'=>'merchant_info_form'))}}
                   <p class="form-tip">{{$errors->first()}}</p>
                   <div class="editblock">
                        <div class="changelogo">
                          <div class="word">更换头像</div>
                          <div class="arrow"></div>
                          <div class="storepic" id="fileclick"><img src="{{$merchant->image?AppHelper::imgSrc($merchant->image->url):'/assets/images/tu01.jpg'}}" id="merchant_image"></div>
                          <input type="file"  name="image_id" style="display:none;" id="upload_merchant_image">
                        </div>
                        <div class="anta-row bdb">
                          <div class="word">昵称</div>
                          <div class="arrow"></div>
                          <div class="input-box">{{Form::text('username',$merchant->username,array('class'=>'inputtext','autocomplete'=>'off','placeholder'=>'请输入昵称'))}}</div>
                        </div>
                        <div class="anta-row">
                          <div class="word">地区</div>
                          <div class="arrow"></div>
                          <div class="input-box">
                            {{Form::text('region',$merchant->region,array('class'=>'inputtext','autocomplete'=>'off','placeholder'=>'请输入地区名称'))}}
                            {{--<span id="choose_province_span">请选择省</span>  <span id="choose_city_span">请选择市</span>--}}
                            {{--{{Form::text('username',$merchant->username,array('class'=>'inputtext','id'=>'age-input','autocomplete'=>'off'))}}--}}
                            {{--{{Form::text('username',$merchant->username,array('class'=>'inputtext','id'=>'age-input','autocomplete'=>'off'))}}--}}
                            {{--{{Form::select('provinces',get_all_provinces(),null,array('class'=>'region','id'=>'select_province'))}}--}}
                            {{--{{Form::select('citys',[''=>'请选择市'],null,array('class'=>'region','id'=>'select_city'))}}--}}
                            {{--{{Form::hidden('region_id','',array('id'=>'region_id'))}}--}}
                          </div>
                        </div>
                   </div>

                   <div class="editblock">
                        <div class="anta-row bdb">
                          <div class="word">年龄</div>
                          <div class="arrow"></div>
                          <div class="input-box">{{Form::text('age',$merchant->age,array('class'=>'inputtext','id'=>'age-input','autocomplete'=>'off','placeholder'=>'请输入年龄'))}}</div>
                        </div>

                        <div class="anta-row">
                          <div class="word">性别</div>
                          <div class="arrow"></div>
                          <div class="input-box skin-flat">
                            {{Form::radio('sex',1,$merchant->sex==1,array('class'=>'inputtext','id'=>'sex-male-radio'))}} <label for="sex-male-radio">男</label>
                            {{Form::radio('sex',0,$merchant->sex==0,array('class'=>'inputtext','id'=>'sex-female-radio'))}}<label for="sex-female-radio">女</label>
                          </div>
                        </div>
                   </div>


                 </div>



            </section>
            <!-- content -->



        </div>
    </div>
@stop