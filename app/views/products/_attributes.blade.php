<div id="product-attr-select-form-bg">
	<div id="product-attr-select-form-wrapper">
		<div class="product-base-info clearfix">
			<div id="close-form-button"></div>
			<div class="prod-img">
				{{AppHelper::img($product->image->url)}}
			</div>
			<div class="prod-price">
				<span id="sale-price">￥{{$priceStr}}</span>
				<span class="prod-stock">(库存：<i id="total-stock">{{$stock}}</i>)</span>
			</div>
			<div class="prod-selected-attr">
				<span>请选择：{{$optionNames}}</span>
			</div>
		</div>
		<div id="product-attributes">
			{{Form::open(['url'=>URL::route('checkout.direct'),'id'=>'product-attributes-form'])}}
			@foreach($product->options as $key=>$option)
			<div class="attribute">
				<div class="attr-name">
					{{$option->name}}
				</div>
				<div class="attr-list clearfix">
					<ul>
						@foreach($option->values as $value)
							@if(in_array($value->id,$voIds))
								<li class="option" data-optId="{{$option->id}}" data-optValId="{{$value->id}}">
									<span>{{$value->name}}</span>
								</li>
							@endif
						@endforeach
					</ul>
				</div>
			</div>
			@endforeach
			<div id="product-buy-count" class="clearfix">
				<label>数量</label>
				<div class="buy-count-form">
					<input id="buy-count" type="text" value="1" name="num" />
					<span class="sub">-</span>
					<span class="plus">+</span>
				</div>
			</div>
			{{Form::hidden('entityId',0,['id'=>'entityId'])}}
			{{Form::hidden('productId',$product->id)}}
			{{Form::hidden('shopId',$shop_id,['id'=>'shopId'])}}
			{{Form::close()}}
		</div>
	</div>
</div>

@section('scripts')
	@parent
	<script type="text/javascript">
		var AttrForm = new Object();
		AttrForm['productEntities'] = {{$product->entities}};//所有商品组合实例
		AttrForm['optionsCount'] = {{$product->options->count()}};
		AttrForm['totalStock'] = {{$stock}}; //总库存
		AttrForm['selectedIds'] = new Object();//选中参数数组
		AttrForm['productId'] = {{$product->id}};
	</script>
	{{HTML::script('/assets/js/attr_form.js')}}
@stop