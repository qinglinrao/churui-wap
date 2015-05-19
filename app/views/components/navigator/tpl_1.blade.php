@foreach($element->data as $nav)
    @if($nav->visible)
        <div class="nav-item clearfix" style="width:{{$nav->width}}">
            <a href="{{$nav->link}}">
                <div class="nav-item-img {{$nav->code}}"></div>
                <div class="nav-item-name"><span>{{$nav->name}}</span></div>
            </a>
        </div>
    @endif
@endforeach
