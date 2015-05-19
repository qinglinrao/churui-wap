<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" >
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Expires" CONTENT="-1">
    <meta http-equiv="Cache-Control" CONTENT="no-cache">
    <meta http-equiv="Pragma" CONTENT="no-cache">
    <title>初睿</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    {{HTML::style('assets/css/icheck/all.css?v=1.0.2')}}
    {{--{{HTML::style('assets/css/base.css')}}--}}
    {{--{{HTML::style('assets/css/public.css')}}--}}
    {{--{{HTML::style('assets/css/layout.css')}}--}}
    {{--{{HTML::style('libraries/owl-carousel/owl.carousel.css')}}--}}
    {{--{{HTML::style('libraries/owl-carousel/owl.transitions.css')}}--}}
    {{HTML::style('assets/css/merchant.css')}}
    {{HTML::style('assets/css/owlbanner.css')}}
    {{HTML::script('libraries/jquery-1.11.1.js')}}
    {{HTML::script('assets/js/media.js')}}
    <script>
      window.scale = 1.0;
     var image_site = 'http://localhost:8089';
    </script>
  </head>

  <body class="classical">

    @yield('wrapper')

    {{--@include('public.back2top')--}}

    @include('public.message')

    <div class="javascript-wrapper">

      {{HTML::script('assets/js/owl.carousel.js')}}
      {{HTML::script('assets/js/icheck.min.js?v=1.0.2')}}


      {{ HTML::script('assets/js/file-upload/jquery.ui.widget.js') }}
      {{ HTML::script('assets/js/file-upload/jquery.iframe-transport.js') }}
      {{ HTML::script('assets/js/file-upload/jquery.fileupload.js') }}

      {{HTML::script('assets/js/jquery.zclip.min.js')}}

      {{HTML::script('assets/js/merchant.js')}}
      {{HTML::script('assets/js/jquery.sha1.js')}}
      {{HTML::script('http://res.wx.qq.com/open/js/jweixin-1.0.0.js')}}
      {{HTML::script('libraries/jquery.wechat.share.js')}}

      @yield('scripts')
      {{--{{HTML::script('packages/frenzy/turbolinks/turbolinks.js')}}--}}
    </div>
  </body>
</html>
