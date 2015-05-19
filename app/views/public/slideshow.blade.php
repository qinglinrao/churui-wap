<div class="slideshow-wrapper">
  @if(!empty($images))
    @foreach($images as $image)
    <div class="slide">
      <div class="slide-img">
        <a href="#">{{AppHelper::img($image->url,$image->alt)}}</a>
      </div>
    </div>
    @endforeach
  @else
    <div class="slide">
      <div class="slide-img">
        <a href="#"><img src="/assets/images/slide.png" /></a>
      </div>
    </div>
  @endif
</div>