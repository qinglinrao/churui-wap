<!doctype html>
<html>
  <head>
  <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" >

      <title>初睿</title>
      <meta name="keywords" content=""/>
      <meta name="description" content=""/>
    {{HTML::style('assets/css/base.css')}}
    {{HTML::style('assets/css/public.css')}}
    {{--{{HTML::style('assets/css/layout.css')}}--}}
    {{HTML::style('assets/css/layout.css')}}
    {{HTML::style('libraries/owl-carousel/owl.carousel.css')}}
    {{HTML::style('libraries/owl-carousel/owl.transitions.css')}}
    {{HTML::style("assets/css/classical-style.css")}}
    {{HTML::style("assets/css/agent.css")}}
    {{HTML::script('libraries/jquery-1.11.1.js')}}
    {{--{{HTML::script('assets/js/media.js')}}--}}
{{--    {{HTML::style("assets/css/fashion-style.css")}}--}}

    <script>
      window.scale = 1.0;
    </script>
  </head>

  <body class="classical">

    @yield('wrapper')

    {{--@include('public.back2top')--}}

    @include('public.message')

    <div class="javascript-wrapper">

      {{HTML::script('assets/js/jquery.zclip.min.js')}}
      {{--{{HTML::script('packages/frenzy/turbolinks/jquery.turbolinks.js')}}--}}
      {{HTML::script('libraries/jquery.mobile-events.min.js')}}
      {{HTML::script('libraries/icheck.js')}}
      {{HTML::script('libraries/owl-carousel/owl.carousel.js')}}
      {{HTML::script('libraries/iscroll.js')}}
      {{HTML::script('assets/js/message.js')}}
      {{HTML::script('assets/js/public.js')}}
      {{HTML::script('assets/js/users.js')}}
      {{HTML::script('assets/js/products.js')}}
      {{HTML::script('assets/js/checkout.js')}}
      {{HTML::script('assets/js/jquery.sha1.js')}}
      {{HTML::script('http://res.wx.qq.com/open/js/jweixin-1.0.0.js')}}
      {{HTML::script('libraries/jquery.wechat.share.js')}}
      @yield('scripts')
      {{--{{HTML::script('packages/frenzy/turbolinks/turbolinks.js')}}--}}
    </div>
  </body>
</html>
