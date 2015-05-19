@foreach($element->data as $k => $p)
  @if($k < $element->dataLimit)
    <div class="product clearfix">
      <img class="prod-img" src="{{$p->thumb->url}}"/>
      <div class="prod-name"><span>{{$p->name}}</span></div>
      <div class="prod-parprice"><span>￥{{$p->par_price}}</span></div>
      <div class="prod-saleprice"><span>￥{{$p->sale_price}}</span></div>
    </div>
  @endif
@endforeach
