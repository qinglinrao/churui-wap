@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">商品评论</h1>
			</div>
		</div>
		<div id="main-content">
			<div class="product-comments clearfix">
				<div class="comments-info clearfix">
					<div class="comments-count">
						商品评价（{{$comments->getTotal()}}）
					</div>
					<div class="comments-avg-start">
						<ul class="five-star">
							@for($i = 1; $i <=5; $i++)
								<li class="{{($i <= $avgStar ? 'active ': '').$i}}"></li>
							@endfor
						</ul>
					</div>
				</div>
				@foreach($comments as $comment)
					<div class="comment clearfix">
						<div class="comment-user clearfix">
							<div class="user-pic">
								<img src="{{$comment->user->detail->image ? AppHelper::imgSrc($comment->user->detail->image->url ): '/assets/images/default_head.jpg'}}" />
							</div>
							<div class="user-name">
								{{AppHelper::cutStr($comment->author)}}
							</div>
							<div class="comments-avg-start">
								<ul class="five-star">
									@for($i = 1; $i <=5; $i++)
										<li class="{{($i <= $comment->star ? 'active ': '').$i}}"></li>
									@endfor
								</ul>
							</div>
						</div>
						<div class="comment-detail">
							<span>{{$comment->detail}}</span>
						</div>
						<div class="comment-time">
							{{$comment->created_at}}
						</div>
						<div class="comment-prod-attr">
						    @if($comment->entity)
						    {{$comment->entity->option_set_values}}
						    @endif

						</div>
					</div>
				@endforeach
			</div>
		</div>
	</div>
@stop