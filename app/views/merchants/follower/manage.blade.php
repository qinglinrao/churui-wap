@extends('public/template')

@section('wrapper')
	<div class="sunn_wrapper">
        <div id="sunn_main">

            <section class="header">
                <div class="htitle common">门店管理</div>
                <a href="javascript:history.back(-1)" class="hleft"></a>
            </section><!-- 头部 -->

            <section class="content">
               <div class="rowblock">
                  <a href="{{URL::route('merchants.follower.apply_list')}}">
                   <div class="evticon pc04">
                        <div class="etleft">
                         入驻审核
                        </div>
                        <div class="etarrow">
                        </div>
                   </div>
                  </a>

                  <a href="{{URL::route('merchants.follower.list')}}">
                   <div class="evticon pc05">
                        <div class="etleft">
                         {{get_follow_link_name($merchant->merchant_grade+1)}}列表
                        </div>
                        <div class="etarrow">
                        </div>
                   </div>
                  </a>

            </div>


            </section>
            <!-- content -->



        </div>
    </div>
@stop