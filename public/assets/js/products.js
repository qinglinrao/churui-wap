/**
 * Created by hardywen on 14/12/9.
 */

(function($){
    $(document).on('ready',function(){


        $('.theme-switcher span').on('click',function(){
            $('.theme-switcher span').removeClass('active');
            $(this).addClass('active');
            $('.products-list').removeClass('one-col two-col image').addClass($(this).data('type'));
        });

        //product detail page ----------------------------------------------

        var $wrapperBg = $('#product-attr-select-form-bg');
        var $wrapper = $('#product-attr-select-form-wrapper');
        var $prodInfo = $('#product-attr-select-form-wrapper .product-base-info');
        var $attributes = $('#product-attributes');
        var scrollTop = 0;
        var showing = false; //属性选择框开启状态


        //toggle drop down menu
        $('#header').delegate('.icon-menu','tap',function(){
            $('.dropdown-menu-wrapper').toggle();
        });


        //toggle collection
        $('.collect-button').on('click', function () {
            var $self = $(this);
            $.ajax({
                url: '/customer/favorites/'+$self.data('pid'),
                dataType: 'json',
                type: 'post',

                success:function(result){
                    if(result.state == 1){
                        $self.toggleClass('collected');
                    }else{
                        showMessage(result.msg);
                    }
                }
            })
        });



        $('#footer').delegate('.add-to-cart-button, .buy-button','tap',function(){
            if (showing) {
                if(AttrForm.entityId > 0){
                    if($(this).hasClass('add-to-cart-button')){ //加入购物车
                        _addToCart();
                    }else{ //直接购买
                        _buyDirect();
                    }

                }else{
                    alert('请选择需要购买的商品');
                }

            }else{
                if($(this).hasClass('add-to-cart-button')){
                    var buyDirect = false;
                }else{
                    var buyDirect = true;
                }
                openAttributesForm(true,buyDirect);
            }
        });

        $('.select-attributes').on('tap',function(){
            openAttributesForm(false);
        });

        $('.confirm .submit-button').on('tap',function(){
            if(AttrForm.entityId > 0){
                if($(this).attr('buydirect') === 'false'){ //加入购物车
                    _addToCart();
                }else{ //直接购买
                    _buyDirect();
                }

            }else{
                alert('请选择需要购买的商品');
            }
        })


        $wrapper.delegate('#close-form-button','tap',function(){
            closeAttributesForm();
        });

        //add to cart
        function _addToCart(){
            $.ajax({
                url: '/shopping/cart/add',
                data:{
                    entityId: AttrForm.entityId,
                    buyCount: $('#buy-count').val(),
                    productId: AttrForm.productId,
                    shopId: $('input#shopId').val()
                },
                type: 'post',
                dataType: 'json',
                success:function(result){
                    if(result.state == 1){
                        showMessage(result.msg);
                        $('.cart-prod-num span').text(result.cartItems); //更新购物icon上面的数字
                    }else{

                    }
                }
            })
        }

        //buy direct
        function _buyDirect(){
            $('input#entityId').val(AttrForm.entityId);
            $('#product-attributes-form').submit();
        }

        //open attributes select form
        function openAttributesForm(confirm,buyDirect){
            //set attributes form height in product detail page
            showing = true;
            var win_h = $(window).height();
            if($wrapper.height() > win_h*0.6){
                $wrapper.height(win_h*0.6);
            }
            $attributes.height($wrapper.height() - $prodInfo.outerHeight())

            scrollTop = $(window).scrollTop();

            $('html,body,#main-wrapper').addClass('noscroll')
            setTimeout(function(){
                $wrapperBg.addClass('showing');
            },50)

            if(confirm){
                $('#footer').addClass('selecting')
            }else{
                $('#footer').removeClass('selecting')
            }

            $('.confirm .submit-button').attr('buydirect',buyDirect);

        }
        //close attributes select form
        function closeAttributesForm(){
            $wrapperBg.removeClass('showing');
            $('html,body,#main-wrapper').removeClass('noscroll');
            $(window).scrollTop(scrollTop);
            $('#footer').removeClass('selecting');
            showing = false;
        }



    })
})(jQuery);
