@foreach($element->data as $menu)
    @if($menu->visible == 1)
        <div class="nav-item clearfix" style="width:{{$menu->width}}">
            @if(!isset($menu->id))
                <a href="{{URL::route('home')}}" class="{{$menu->active == 1 ? 'active' : ''}}">
                    <span class="nav-item-name"><span>{{$menu->name}}</span></span>
                </a>
            @else
                <a href="{{URL::route('products.categories',$menu->id)}}" class="{{$menu->active == 1 ? 'active' : ''}}">
                    <span class="nav-item-name"><span>{{$menu->name}}</span></span>
                </a>
            @endif
        </div>
    @endif
@endforeach