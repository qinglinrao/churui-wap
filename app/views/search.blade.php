@extends('public.template')

@section('wrapper')
<div class="sunn_wrapper">
    <div id="sunn_main">
       <section class="header">
           <div class=" search homesearch htitle">
            {{Form::open(array('url'=>'search_product','method'=>'get'))}}
            <input type="submit" class="input-submit">
            <input type="text" name="query" class="input-text" placeholder="请输入商品名称" id="query-text">
            {{Form::close()}}
           </div>
           <a href="javascript:history.back(-1)" class="hleft"></a>
           <a href="javascript:void(0)" class="hright" id="reset-input-val">取消</a>

       </section><!-- 头部 -->

        <section class="content">

             <div class="products-list clearfix one-col" data-role="data-wrapper">
                @include('products._product')
             </div>

        </section>
        <!-- content -->



    </div>
</div>
@stop