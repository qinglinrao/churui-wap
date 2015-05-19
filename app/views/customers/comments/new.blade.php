@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">评价</h1>
			</div>
		</div>
		<div id="main-content">
			<div class="comments-new has-padding">
				<div class="comments-form">
					{{Form::open(array('url'=>URL::route('orders.comment.add',array('id'=>$order->id))))}}
						@foreach($order->products as $product)
						<div class="product-comment">
							<div class="product clearfix">
								<div class="prod-img">
									<img src="{{$product->product->image?AppHelper::imgSrc($product->product->image->url):''}}" />
								</div>
								<div class="prod-name">
									<span>{{$product->name}}</span>
								</div>
							</div>
							<div class="comment">
								<div class="five-star-wrapper clearfix">
									<label><span>商品满意度</span></label>
									<ul class="five-star list-unstyled">
										<li class="start start-1 active"></li>
										<li class="start start-2 active" ></li>
										<li class="start start-3 active"></li>
										<li class="start start-4"></li>
										<li class="start start-5"></li>
									</ul>
									{{Form::hidden('comment['.$product->product_entity_id.'][star]','3',array('class'=>'star-num'))}}
                                    {{Form::hidden('comment['.$product->product_entity_id.'][product_id]',$product->product_id)}}
                                </div>
                                <div class="comment-text-field-wrapper">
                                    {{Form::textarea('comment['.$product->product_entity_id.'][detail]','',['class'=>'comment-text-field','placeholder'=>'写下您的评价','rows'=>2])}}}
                                </div>
								{{--<div class="comment-images-wrapper clearfix">--}}
									{{--<div class="img-block">--}}
										{{--<img src="/assets/images/prod_thumb.png" />--}}
									{{--</div>--}}
									{{--<div class="img-block add-img">--}}
										{{--<input type="file" id="add-img-button" class="add-img-field" />--}}
									{{--</div>--}}
								{{--</div>--}}
							</div>
						</div>
						@endforeach
						<input type="submit" value="提交" class="submit-field" />
					{{Form::close()}}
				</div>
			</div>
		</div>
	</div>
@stop