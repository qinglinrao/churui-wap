@extends('public.template')

@section('wrapper')

<div class="sunn_wrapper">
    <div id="sunn_main">
        <p class="form-tip">{{$errors->first()}}</p>
        <section class="header">
            <div class="htitle common">店铺资料</div>
            <a href="{{AppHelper::UrlRoute(false,'merchants.shop')}}" class="hleft"></a>
            <a href="javascript:void(0)" class="hright update_shop">完成</a>
        </section><!-- 头部 -->


        <section class="content">
             {{Form::open(array('url'=>URL::route('merchants.shop.update'),'id'=>'form-edit-shop'))}}
             {{Form::hidden('id',$shop->id)}}
             <div class="store-edit">

               <div class="editblock">
                    <div class="changelogo">
                      <div class="word">更换logo</div>
                      <div class="arrow"></div>
                      <div class="storepic" id="fileclick"><img src="{{$shop->logoImage?AppHelper::imgSrc($shop->logoImage->url):'/assets/images/tu02.jpg'}}" id="show_logo_image"></div>
                      <input type="file" name="logo_image" style="display:none;" shop_id="{{$shop->id}}" id="upload_logo_image" >
                    </div>
                    <div class="anta-row">
                      <div class="word">店铺名称</div>
                      <div class="arrow"></div>
                      <div class="input-box">{{Form::text('name',$shop->name,array('class'=>'inputtext'))}}</div>

                    </div>
               </div>

               <div class="editblock">
                    <div class="anta-row">
                      <div class="word">微信号</div>
                      <div class="arrow"></div>
                      <div class="input-box">{{Form::text('weixin',$shop->weixin,array('class'=>'inputtext'))}}</div>
                    </div>

                    <div class="anta-row">
                      <div class="word">更换店铺封面</div>
                      <div class="arrow"></div>
                      <div class="input-box">
                        <p class="upload_tip">点击上传(尺寸640X320)</p>
                        <input type="file" name="cover_image" shop_id="{{$shop->id}}" id="upload_cover_image"></div>
                    </div>
               </div>

               <div class="editblock">
                    {{Form::textarea('intro',$shop->intro,array('class'=>'ed-textarea'))}}
                    {{--<textarea class="ed-textarea">创立于2006年，是一家集生产、研发、销售、培训为一体的现代化化妆品集团型企业。公司拥有“优理氏、white+cap、香草魔法、永恒情书”等多个护肤品牌，并形成了以“生产研发、代理加盟、电子商务”为支柱的三大产业集团--}}
                      {{--</textarea>--}}
               </div>
               <a href="javascript:void(0)" class="preview-button update_shop" >预览店铺</a>

             </div>
             {{Form::close()}}
        </section>
        <!-- content -->



    </div>
</div>

@stop