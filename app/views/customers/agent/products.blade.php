@extends('public.html')

@section('wrapper')
    <div class="top">
        <ul>
            <li class="back-arrow"><a href="javascript:history.go(-1)"><img src="/assets/images/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">代理产品</li>
            <li class="forward"><a href="{{ URL::route('cash.index') }}" >提现记录</a></li>
        </ul>
    </div>


    <div  class="content">
        <ul>
            @foreach($products as $product)
            <li><a href="{{ URL::route('agent.products.detail',array('id'=>$product->id)) }}">{{ $product->name }}</a></li>
           @endforeach
        </ul>
    </div>
@stop