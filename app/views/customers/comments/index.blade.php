@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a href="{{URL::route('customers.profile')}}" class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">我的评价</h1>
			</div>
			<div class="right">
                <a class="icon-home" href="{{URL::route('home')}}">首页</a>
            </div>
		</div>
		<div id="main-content" class="comments">
			<div class="comments-list clearfix">
				@foreach($comments as $comment)
				<div class="comment">
					<div class="comment-time">
						{{$comment->created_at}}
					</div>
					<div class="comment-text">
						{{$comment->detail}}
					</div>
					<div class="comment-relate-product clearfix">
						<img src="/assets/images/up_arrow.png" class="up-arrow" />
						<div class="prod-img">
							<img src="{{$comment->product->image?AppHelper::imgSrc($comment->product->image->url):''}}" />
						</div>
						<div class="prod-name">
							{{$comment->product->name}}
						</div>
						<div class="prod-sale-price">
							￥{{$comment->product->sale_price}}
						</div>
					</div>
					<div class="comment-reply">
					    @if($comment->replay)
						商家回复<span class="user-name">{{$comment->author}}：</span>{{$comment->replay}}
						@endif
					</div>
				</div>
				@endforeach
			</div>
		</div>
	</div>
@stop