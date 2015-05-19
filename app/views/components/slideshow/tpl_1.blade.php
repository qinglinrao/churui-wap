@foreach($element->data as $slide)
    <div class="slide">
        <div class="slide-img"><a href="{{URL::to($slide->link)}}"><img src="{{$slide->src}}" alt="{{$slide->name}}"/></a></div>
    </div>
@endforeach
