
$(document).ready(function(){



	$("#fileclick").click(function(){
		 console.log(111);
	     $(this).parent().find('input').click();
	})

    $('.owlbanner').each(function(){
        var $self = $(this);
        var time = $self.data('time');
        if($("#owl-banner .item",$self).length < 2) return;

        $("#owl-banner",$self).owlCarousel({
            items: 1,
            loop: true,
            autoplay: true,
            autoplayTimeout: time
        });
    });

    $('#myhnav li').click(function(){
        var _index=$(this).index();
        $('#myhnav li').removeClass("active");
        $(this).addClass("active");
        $('#mytag>div').stop().css("display","none");
        $('#mytag>div').eq(_index).fadeIn(400);
        console.log(_index);
    })

    //复制到剪切版
    $('#copy_input').zclip({
        path: '/assets/js/ZeroClipboard.swf',
        copy: function(){//复制内容
            return $(this).attr('data-val');
        },

        afterCopy: function(){//复制成功
            //$("<span id='msg'/>").insertAfter($('#copy_input')).text('复制成功');
            alert('已成功复制到剪切板!');
        }
    });

    $('input#upload_logo_image').fileupload({
        autoUpload: true,//是否自动上传
        url: '/merchant/shop/upload_logo_image',//上传地址
        formData: {"shop_id":$('input#upload_cover_image').attr('shop_id')},
        dataType: 'json',
        done: function (e, data) {//设置文件上传完毕事件的回调函数
            var result = data.result;
            console.info(result)
            if(result.state == 1){
                $('img#show_logo_image').attr('src',result.msg);
            }else{
                alert(result.msg);
            }

        }
        //progressall: function (e, data) {//设置上传进度事件的回调函数
        //    var progress = parseInt(data.loaded / data.total * 5, 10);
        //    $('#progress .bar').css(
        //        'width',
        //        progress + '%'
        //    );
        //}
    });


    $('input#upload_cover_image').fileupload({
        autoUpload: true,//是否自动上传
        url: '/merchant/shop/upload_cover_image',//上传地址
        formData: {"shop_id":$('input#upload_cover_image').attr('shop_id')},
        dataType: 'json',
        done: function (e, data) {//设置文件上传完毕事件的回调函数
            var result = data.result;
            console.info(result)
            if(result.state == 1){
                alert('上传成功!');
            }else{
                alert(result.msg);
            }
            //$("#myimg").attr({src:data.result.imgurl});
        }
        //progressall: function (e, data) {//设置上传进度事件的回调函数
        //    var progress = parseInt(data.loaded / data.total * 5, 10);
        //    $('#progress .bar').css(
        //        'width',
        //        progress + '%'
        //    );
        //}
    });

    $('a#save_merchant_account').click(function(){
        $('form#merchant_account').submit();
    });


    $('input#upload_id_up_image').fileupload({
        autoUpload: true,//是否自动上传
        url: '/merchant/account/upload_up_image',//上传地址
        dataType: 'json',
        done: function (e, data) {//设置文件上传完毕事件的回调函数
            var result = data.result;
            console.info(result)
            if(result.state == 1){
                $('img#up_image').attr('src',result.msg);
            }else{
                alert(result.msg);
            }
            //$("#myimg").attr({src:data.result.imgurl});
        }
        //progressall: function (e, data) {//设置上传进度事件的回调函数
        //    var progress = parseInt(data.loaded / data.total * 5, 10);
        //    $('#progress .bar').css(
        //        'width',
        //        progress + '%'
        //    );
        //}
    });

    $('input#upload_id_down_image').fileupload({
        autoUpload: true,//是否自动上传
        url: '/merchant/account/upload_down_image',//上传地址
        dataType: 'json',
        done: function (e, data) {//设置文件上传完毕事件的回调函数
            var result = data.result;
            console.info(result)
            if(result.state == 1){
                $('img#down_image').attr('src',result.msg);
            }else{
                alert(result.msg);
            }
            //$("#myimg").attr({src:data.result.imgurl});
        }
        //progressall: function (e, data) {//设置上传进度事件的回调函数
        //    var progress = parseInt(data.loaded / data.total * 5, 10);
        //    $('#progress .bar').css(
        //        'width',
        //        progress + '%'
        //    );
        //}
    });


    $('a.update_shop').click(function(){
        $('form#form-edit-shop').submit();
    })

    autoHideFormTip(3500);
    function autoHideFormTip($time){
        $form_tip = $('p.form-tip');
        if($.trim($form_tip.html()) != "") $form_tip.show();
        $form_tip.css({'margin-left':(-1*$form_tip.width()/2)+'px'});
        if($form_tip != null){
            if($.trim($form_tip.html()) != ""){
                setTimeout(function(){
                    $form_tip.fadeOut(1500);
                },$time);
            }else{
                $form_tip.hide();
            }

        }
    }



    $('.skin-flat input').iCheck({
        checkboxClass: 'icheckbox_flat-red',
        radioClass: 'iradio_flat-red'
    });



    $("input#age-input").keypress(function(event) {
        var keyCode = event.which;
        if (keyCode == 46 || keyCode ==8 || keyCode ==0 || (keyCode >= 48 && keyCode <=57))
            return true;
        else
            return false;
    }).focus(function() {
        this.style.imeMode='disabled';
    });


    $('a#update_merchant_info').click(function(){
        $('form#merchant_info_form').submit();
    });

    $('input#upload_merchant_image').fileupload({
        autoUpload: true,//是否自动上传
        url: '/merchant/info/upload_image',//上传地址
        dataType: 'json',
        done: function (e, data) {//设置文件上传完毕事件的回调函数
            var result = data.result;
            if(result.state == 1){
                $('img#merchant_image').attr('src',result.msg);
            }else{
                alert(result.msg);
            }
            //$("#myimg").attr({src:data.result.imgurl});
        }
        //progressall: function (e, data) {//设置上传进度事件的回调函数
        //    var progress = parseInt(data.loaded / data.total * 5, 10);
        //    $('#progress .bar').css(
        //        'width',
        //        progress + '%'
        //    );
        //}
    });

    //$('select#select_province').prepend('<option value="">请选择省</option>')
    //$('select#select_province').change(function(){
    //    var province_id = $.trim($(this).children('option:selected').val());
    //    var province_name = $.trim($(this).children('option:selected').html());
    //    if(province_id != ""){
    //        $.ajax({
    //            url: '/merchant/region/citys',
    //            data:{'province_id':province_id},
    //            dataType: 'json',
    //            type: 'post',
    //            success: function(result){
    //                $('input#region_id').val(province_id);
    //                $('select#select_province').hide();
    //                $('span#choose_province_span').html(province_name)
    //                $('select#select_city').html('<option value="">请选择市</option>');
    //                var options = '';
    //                $.each(result,function(i,city){
    //                    options += '<option value="'+city.id+'">'+city.name+'</option>'
    //                });
    //                $('select#select_city').append(options);
    //            },
    //            error: function(){
    //                alert('系统出错')
    //
    //            }
    //        })
    //    }
    //});
    //
    //$('span#choose_province_span').click(function(){
    //    $('select#select_city').hide();
    //    $('select#select_province').show();
    //});
    //
    //$('span#choose_city_span').click(function(){
    //    $('select#select_province').hide();
    //    $('select#select_city').show();
    //})
    //
    //
    //
    //$('select#select_city').change(function(){
    //    var city_id = $.trim($(this).children('option:selected').val());
    //    var city_name = $.trim($(this).children('option:selected').html());
    //    $('input#region_id').val(city_id);
    //    $('select#select_city').hide();
    //    $('span#choose_city_span').html(city_name)
    //})


    //$(document).keydown(function (event) {
    //    alert(event.keyCode)
    //})

    $('a#reset-input-val').click(function(){
        $('input#query-text').val('');
    })



    //店铺分享提示弹框
    $('.share_shop_tip .btns input.ok').click(function(){
        hideShareShopTip();
    });
    $('.share_shop_tip .btns input.no').click(function(){
        hideShareShopTip();
        $.ajax( {
            url:'/shop/hide_tip',
            type:'post',
            cache:false,
            dataType:'json',
            success:function(data) {
            },
            error : function() {
                alert('请求出错!')
            }
        });

    });
    function hideShareShopTip(){
        $('.share_shop_tip').remove();
        $('.over-layer').remove();

    }


    $('.region_list').css({'margin-top':-1*$('.region_list').height()/2+'px'});


    $('.regions li').click(function(){

        chooseOneRegion(this);
    });


    function chooseOneRegion(obj) {
        var region_id = $(obj).attr('region_id');
        var province_id = $(obj).attr('province_id');
        var city_id = $(obj).attr('city_id');
        var district_id = $(obj).attr('city_id');
        var name = $(obj).html();
        var region_grade = $(obj).attr('region_grade');

        addNewRegion(obj);

        if (region_grade == '1') {
            //拉取市级

            $.ajax({
                url: '/merchant/region/citys',
                type: 'post',
                cache: false,
                data: {'province_id': region_id},
                dataType: 'json',
                success: function (data) {
                    if (data.length > 0) {
                        $('.region_list ul.title li.cur').removeClass('cur');
                        $('.region_list ul.title li').eq(1).addClass('cur');
                        var regions = $('ul.regions');
                        regions.html('');
                        $.each(data, function (i, item) {
                            $li = $(' <li class="" region_grade="2" region_id="' + item.id + '" province_id="' + item.province_id + '" city_id="' + item.city_id + '" district_id="' + item.district_id + '">' + item.name + '</li>');
                            regions.append($li);
                            $li.click(function () {
                                chooseOneRegion(this);
                            })
                        })
                    }else{
                        $('.region_list,.over-layer').hide();
                        loadAllProvinces();
                    }

                },
                error: function () {
                    alert('请求出错!')
                }
            });
        } else if (region_grade == '2') {
            $.ajax({
                url: '/merchant/region/districts',
                type: 'post',
                cache: false,
                data: {'city_id': region_id},
                dataType: 'json',
                success: function (data) {
                    if (data.length > 0) {
                        $('.region_list ul.title li.cur').removeClass('cur');
                        $('.region_list ul.title li').eq(2).addClass('cur');
                        var regions = $('ul.regions');
                        regions.html('');
                        $.each(data, function (i, item) {
                            $li = $(' <li class="" region_grade="3" region_id="' + item.id + '" province_id="' + item.province_id + '" city_id="' + item.city_id + '" district_id="' + item.district_id + '">' + item.name + '</li>');
                            regions.append($li);
                            $li.click(function () {
                                chooseOneRegion(this);
                            })
                        })
                    }else{
                        $('.region_list,.over-layer').hide();
                        loadAllProvinces();
                    }
                },
                error: function () {
                    alert('请求出错!')
                }
            });
        }else if(region_grade == '3'){
            $('.region_list,.over-layer').hide();

            loadAllProvinces();
        }
    }

    function addNewRegion(obj){
        var id = $(obj).attr('region_id');
        var province_id = $(obj).attr('province_id');
        var city_id = $(obj).attr('city_id');
        var district_id = $(obj).attr('city_id');
        var name = $(obj).html();
        var grade = $(obj).attr('region_grade');


        var is_exist = false;
        var hasChooseRegion = $('.responsible_area ul li.region');
        if(hasChooseRegion.size() >=6) {
            $('.responsible_area ul li.choose').hide();
        }
        $li = $(' <li class="region" region_grade="' +grade + '" region_id="' + id + '" province_id="' + province_id + '" city_id="' + city_id + '" district_id="' + district_id + '"><b>' + name + '</b><span>-</span></li>')
        hasChooseRegion.each(function(){
            var region = $(this);
            var region_id = region.attr('region_id');
            var region_province_id = region.attr('province_id');
            var region_city_id = region.attr('city_id');
            var region_district_id = region.attr('city_id');
            var region_name = region.html();
            var region_grade = region.attr('region_grade');

            //已选的地区 是 备选地区的省
            if(region_id == province_id || region_id == city_id){
                $li = $(' <li class="region" region_grade="' +grade + '" region_id="' + id + '" province_id="' + province_id + '" city_id="' + city_id + '" district_id="' + district_id + '"><b>' + region_name+name + '</b><span>-</span></li>');
                $(this).remove();
            }else if(id == region_id){
                is_exist = true;
                return ;
            }
        });

        if(is_exist == false)
        $('.responsible_area ul').append($li);

    }

    function loadAllProvinces(){
        $.ajax({
            url: '/merchant/region/provinces',
            type: 'post',
            cache: false,
            dataType: 'json',
            success: function (data) {
                if (data.length > 0) {
                    $('.region_list ul.title li.cur').removeClass('cur');
                    $('.region_list ul.title li').eq(0).addClass('cur');
                    var regions = $('ul.regions');
                    regions.html('');
                    $.each(data, function (i, item) {
                        $li = $(' <li class="" region_grade="1" region_id="' + item.id + '" province_id="' + item.province_id + '" city_id="' + item.city_id + '" district_id="' + item.district_id + '">' + item.name + '</li>');
                        regions.append($li);
                        $li.click(function () {
                            chooseOneRegion(this);
                        })
                    })
                }
            },
            error: function () {
                alert('请求出错!')
            }
        });
    }

    $('.responsible_area ul li.choose').click(function(){
        $('.region_list,.over-layer').show();
        loadAllProvinces();
    });

    $('.region_list h4 button.close_window').click(function(){
        $('.region_list,.over-layer').hide();
        loadAllProvinces();
    })




})