<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=320px, initial-scale=1.0, minimum-scale=0.1, user-scalable=0" >
    <title>麦多</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    {{HTML::style('components/bootstrap.min.css')}}
    {{HTML::style('libraries/owl.carousel2/assets/owl.carousel.css')}}
    {{HTML::style('components/baseStyle.css')}}
    {{HTML::style('components/products/style.css')}}
    {{HTML::style('components/mainmenu/style.css')}}
    {{HTML::style('components/ads/style.css')}}
    {{HTML::style('components/slideshow/style.css')}}
    {{HTML::style('components/search/style.css')}}
    {{HTML::style('components/navigator/style.css')}}
  </head>
  <body>
  <div class="phone-wrapper-inner">
    <div id="preview-region" class="{{$page->theme}}">
      <div class="region-warp ui-sortable">
        {{$html}}
      </div>
    </div>
    @if (isset($qrcode) && $qrcode == true)
      <div class="qrcode-wrapper">
        <div class="qrcode">

        </div>
        <div class="qrcode-text">扫一扫，到手机预览</div>
      </div>
    @endif
  </div>
  {{HTML::script('libraries/jquery-1.11.1.js')}}
  {{HTML::script('libraries/jquery.qrcode.min.js')}}
  {{HTML::script('libraries/jquery.mobile-events.min.js')}}
  {{HTML::script('libraries/owl.carousel2/owl.carousel.js')}}
  {{HTML::script('components/startup.js')}}
  </body>
</html>