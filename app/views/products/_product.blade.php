@if($products->count() > 0 )
  @foreach($products as $product)
    <div class="product clearfix">
      <div class="prod-img">
        <a href="{{AppHelper::UrlRoute(false,'products.detail',$product->id)}}">
           @if($product->image)
          {{AppHelper::img($product->image->url)}}
          @endif
        </a>
      </div>
      <div class="prod-name">
        <a href="{{AppHelper::UrlRoute(false,'products.detail',$product->id)}}">{{AppHelper::ellipse($product->name,22)}}</a>
      </div>
      <div class="prod-par-price">
        <span>￥{{AppHelper::price($product->par_price)}}</span>
      </div>
      <div class="prod-sale-price">
        <span>￥{{AppHelper::price($product->sale_price)}}</span>
      </div>
      <div class="prod-sales-count">
        <span>已售{{$product->sale_count}}件</span>
      </div>
    </div>
  @endforeach
@else
  <div class="no-data has-padding">
    <span>没有找到相关商品</span>
  </div>
@endif