/**
 * Created by hardywen on 14/11/21.
 */
(function ($) {

    /**
     page:load  turbolinks.js 事件
     */
    $(document).on('ready',function () {

        $('.iscroll-wrapper').each(function(i,el){
            var width = 0;
            var $self = $(this);
            $('li',$self).each(function(){
                width += $(this).outerWidth();
            });

            $('.scroll-content',$self).width(width);

            new IScroll(el, {eventPassthrough: true, scrollX: true, scrollY: false, preventDefault: false });
        })

        //setup ajax default options

        $.ajaxSetup({
           complete:function(xhr, status){
              // console.log(xhr, status)
               if(xhr.status == 401){
                   window.location.href = '/customer/login';
               }
           }
        });


        $('span.cancel-search').on('click',function(){
            $('input.keyword-field').val('')
        });

        //int iCheck plugin
        $('input').iCheck()


        //update viewport to fix view-------------------------------------------------------

        $(window).on('orientationchange',function(e){
            var width = window.innerWidth * window.scale;
            var scale, content;
            scale = width/640;
            content = "width=640px,initial-scale="+scale+",minimum-scale=0.1,user-scalable=no";

            $('meta[name=viewport]').attr('content',content);

            //if(scale != parseFloat(window.scale)){
            //    window.scale = scale;
            //    $.get('/set-scale?scale='+scale)
            //}

        });
        //if(window.scale == 1){
            $(window).trigger('orientationchange')
        //}


        // hide top message after 3s-----------------------------------------------------
        setTimeout(function(){
            $('.top-message').fadeOut(500);
        },3000)


        //int slide show----------------------------------------------------------------
        var $owl = $('.slideshow-wrapper')
        $owl.owlCarousel({
            autoPlay : true,
            lazyLoad : false,
            singleItem : true
        })

        //history back to previous page
        $('a.go-back').on('click',function(){
            window.history.back();
        })


        //地址选项
        $('.locations').each(function(i) {

            $(this).find('select.province').change(function() {
                var proviceid = $(this).val()

                $(this).closest('.locations').find('.city').html(_getCities(proviceid))
                $(this).closest('.locations').find('.district').html(_getDistricts(0))
            })
            $(this).find('select.city').change(function() {
                var cityid = $(this).val()
                $(this).closest('.locations').find('.district').html(_getDistricts(cityid))
            })

            $(this).find('select.city').on("focus", function() {
                if (parseInt($(this).val()) > 0)
                    return
                pid = parseInt($(this).closest('.locations').find('select.province').val())
                $(this).html(_getCities(pid))
            })

            $(this).find('select.district').on("focus", function() {
                if (parseInt($(this).val()) > 0)
                    return
                cid = parseInt($(this).closest('.locations').find('select.city').val())
                $(this).html(_getDistricts(cid))
            })

        })



        function _getCities(pid) {

            html = '<option value="0">--请选择--</option>';
            for (i in window.addr_locations.cities) {
                city = window.addr_locations.cities[i]
                if (city.province_id == pid) {
                    html += '<option value="' + city.id + '">' + city.name + '</option>';
                }
            }

            return html;
        }

        function _getDistricts(cid) {

            html = '<option value="0">--请选择--</option>';
            for (i in window.addr_locations.districts) {
                district = window.addr_locations.districts[i]
                if (district.city_id == cid) {
                    html += '<option value="' + district.id + '">' + district.name + '</option>';
                }
            }

            return html;
        }


        //set categories page left col height
        var $leftCol = $('.product-categories .left');
        var minHeight = $(document).height() - $('#header').outerHeight();
        if ($leftCol.height() < minHeight){
            $leftCol.height(minHeight);
        }

    })
}) (jQuery)
