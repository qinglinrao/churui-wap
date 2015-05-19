(function($){
    var width = screen.width;
    var height = screen.height;
    var scale, content;
    $(window).on('orientationchange',function(e){
        if(e.orientation == 'portrait'){
            scale = width/320;
        }else{
            scale = height/320;
        }
        content = "width=320px,initial-scale="+scale+",minimum-scale=0.5,user-scalable=no";
        $('meta[name=viewport]').attr('content',content);
    })

    $(window).trigger('orientationchange')

    $('.component-slideshow').each(function(){
        var $self = $(this);
        var rtl = $self.data('rtl') == 0;
        var time = $self.data('time');
        if($("#slideshow .slide",$self).length < 2) return;

        $("#slideshow",$self).owlCarousel({
            items: 1,
            loop: true,
            autoplay: true,
            rtl: rtl,
            autoplayTimeout: time
        });
    })


    //生成二维码
    if($('.qrcode').length > 0){
        $('.qrcode').qrcode({
            width: 150,
            height: 150,
            text: window.location.href
        });
    }
})(jQuery)