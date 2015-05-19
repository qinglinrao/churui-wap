@extends('public.html')

@section('scripts')
<script type="text/javascript">
    window.addr_locations = new Object();
    window.addr_locations.provices = <?php echo $locations['provices']; ?>;
    window.addr_locations.cities = <?php echo $locations['cities']; ?>;
    window.addr_locations.districts = <?php echo $locations['districts']; ?>;
</script>
@stop


@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a href="javascript:history.go(-1)" class="go-back">返回</a>
			</div>
			<div class="center">

				<h1 id="page-title">添加地址</h1>
			</div>
		</div>
		<div id="main-content">
		    {{Form::open(array('url'=>URL::route('address.create'),'id'=>'new_address','class'=>'new-address-form'))}}
			   <p class="form-tip">{{$errors->first()}}</p>
				<div class="new-address-wrapper">
					<div class="block">
						<div class="field-wrapper">
						    {{Form::text('name','',array('id'=>'address_consignee','class'=>'consignee-field','placeholder'=>'收件人姓名'))}}
						</div>
						<div class="field-wrapper">
						    {{Form::text('telephone','',array('id'=>'address_phone','class'=>'phone-field','placeholder'=>'电话号码'))}}
						</div>
						<div class="field-wrapper">
						    {{Form::location('region',$region,1)}}

						</div>
						<div class="field-wrapper">
							{{Form::text('address','',array('id'=>'address_address','class'=>'address-field','placeholder'=>'详细地址'))}}
						</div>
					</div>
					<div class="field-wrapper">
					    {{Form::hidden('redirect',Input::get('redirect'))}}
					    {{Form::submit('保存',array('class'=>'submit-field'))}}
					</div>
				</div>
			{{Form::close()}}
		</div>
	</div>
@stop