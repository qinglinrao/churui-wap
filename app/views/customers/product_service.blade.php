@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a href="javascript:history.go(-1)" class="go-back">返回</a>
			</div>
			<div class="center">

				<h1 id="page-title">售后服务</h1>
			</div>
		</div>
		<div id="main-content">
		    <div class="sale_service_wrapper">
                <ul>
                    @foreach($product_services as $service)
                    <li>
                        <h4 class="service-name">{{$service->name}} ：</h4>
                        <div class="service-note">
                            {{$service->note}}
                        </div>
                    </li>
                   @endforeach
                </ul>
		    </div>
		</div>
	</div>
@stop