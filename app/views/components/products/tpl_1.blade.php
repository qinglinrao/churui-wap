@foreach($element->data as $k => $p)
  @if($k < $element->dataLimit)
    <a href="{{URL::route('products.detail',$p->id)}}">
      <div class="product clearfix">
        <img class="prod-img" src="{{$p->thumb->url}}"/>
        <div class="prod-name"><span>{{$p->name}}</span></div>
        <div class="prod-saleprice"><span>￥{{$p->sale_price}}</span></div>
        <div class="prod-sale"><span>已售{{$p->sale_count}}件</span></div>
      </div>
    </a>
  @endif
@endforeach
