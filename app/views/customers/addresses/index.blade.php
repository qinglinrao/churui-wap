@extends('public.html')

@section('wrapper')
    <div class="top">
        <ul>
            <li class="back-arrow"><a href="javascript:history.go(-1)"><img src="/assets/images/churui/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">管理收货地址</li>
            <li class="forward"><a href="{{URL::route('address.add')}}" >添加地址</a></li>
        </ul>
    </div>

    @if(isset($d_address))
    <div  class="morendizhi">
        <div  class="dizhi-title">
            <p>
                <a href=""><span class="dizhi-item">默认地址</span></a>
                <a href="{{URL::route('address.del',array('id'=>$d_address->id))}}" onclick="return confirm('你确定要删除该地址吗?')"><span class="dizhi-del">删除</span></a>
                <a href="{{URL::route('address.edit',array('id'=>$d_address->id))}}"><span class="dizhi-edit">编辑</span></a>
            </p>
        </div>
        <div  class="dizhi-detailed">
            <p class="dizhi">{{$d_address->alias}}</p>
            <p>
                <span class="gldz-name">{{$d_address->name}}</span>
                <span class="gldz-tel">{{$d_address->mobile}}</span>
            </p>
        </div>
    </div>
    @endif

    @foreach($addresses as $address)
    <div  class="other-dizhi">
        <div  class="dizhi-title">
            <p>
                <a href="javascript:void(0)"><span class="dizhi-item">地址</span></a>
                <a href="{{ URL::route('address.default',array('id'=>$address->id)) }}"><span class="dizhi-item" style="font-size: 10px;">(点击设置为默认地址)</span></a>
                <a href="{{URL::route('address.del',array('id'=>$address->id))}}" onclick="return confirm('你确定要删除该地址吗?')"><span class="dizhi-del">删除</span></a>
                <a href="{{URL::route('address.edit',array('id'=>$address->id))}}"><span class="dizhi-edit">编辑</span></a>
            </p>
        </div>
        <div  class="dizhi-detailed">
            <p class="dizhi">{{$address->alias}}</p>
            <p>
                <span class="gldz-name">{{$address->name}}</span>
                <span class="gldz-tel">{{$address->telephone}}</span>
            </p>
        </div>
    </div>
    @endforeach
@stop