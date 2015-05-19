@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a href="javascript:history.go(-1)" class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">地址管理</h1>
			</div>
			<div class="right">
				<a href="{{URL::route('address.add')}}" class="new-address icon-menu">new</a>
			</div>
		</div>
		<div id="main-content">
			<div class="user-addresses">
                {{$errors->first()}}
			    @foreach($addresses as $address)
				<div class="address-wrapper">
					<div class="top clearfix">
					    <form action="{{URL::route('address.default',array('id'=>$address->id))}}" method="post">
						    <input type="radio" value="{{$address->id}}" name="default" {{$address->default?'checked':''}} class="address-default-radio" />
						</form>
						<label class="{{$address->default?'checked':''}}">{{$address->default?'默认地址':'地址'}}</label>
						<div class="address-actions">
							<a href="{{URL::route('address.edit',array('id'=>$address->id))}}" class="edit-addr"><span>编辑</span></a>
							<a href="{{URL::route('address.del',array('id'=>$address->id))}}" class="delete-addr" onclick="return confirm('你确定要删除该地址吗?')"><span>删除</span></a>
						</div>
					</div>
					<div class="bottom clearfix">
						<div class="address-detail">
							{{$address->alias}}
						</div>
						<div class="receiver-name">
							{{$address->name}}
						</div>
						<div class="phone">
							{{$address->telephone}}
						</div>
					</div>
				</div>
				@endforeach

			</div>
		</div>
	</div>
@stop