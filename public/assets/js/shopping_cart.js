/**
 * Created by hardywen on 15/1/6.
 */

(function($){
    $(document).on('ready',function(){

        /**
         *删除购物车商品
         */
        var deleting = false;
        $('.delete-collect').on('tap',function(){
            var $self = $(this);
            var itemId = $self.data('itemid');
            $.ajax({
                url:'/shopping/cart/delete',
                data:{itemId:itemId},
                type: 'post',
                dataType: 'json',
                beforeSend:function(){
                    if(deleting) return;
                    deleting = true;
                    $self.addClass('deleting');
                },

                success:function(result){
                    if(result.state == 1){
                        var $product = $('div.product[data-itemid="'+itemId+'"]');
                        $product.slideUp(300,function(){
                            $product.remove();
                            _countTotalPrice();
                        })
                    }
                    showMessage(result.msg);
                    deleting = false;
                    $self.removeClass('deleting');
                }
            })
        });


        /**
         * 更新购物车商品数量
         */

        $('.products-list .product').each(function(){
            var $self = $(this);
            var $buyCountField = $('.buy-count',$self);
            var stock = parseInt($buyCountField.data('stock'));

            $('.buy-count-form span',$self).on('click',function(){
                var count = parseInt($buyCountField.val());
                if($(this).hasClass('sub')){
                    count = count <= 1 ? 1 : count - 1;
                }else{
                    count += 1;
                }
                _checkBuyCount($buyCountField,count,stock)
            });

            $buyCountField.on('change',function(){
                var count = parseInt($buyCountField.val());
                _checkBuyCount($buyCountField,count,stock)
            })
            function _checkBuyCount($buyCountField,count,stock){
                if(count > stock){
                    count = stock;
                    showMessage('您购买的数量超过了商品库存！')
                }
                $buyCountField.val(count);
                _updateCount($buyCountField);
                _countTotalPrice();
            }
        })

        var updating;
        function _updateCount($buyCountField){
            var count = parseInt($buyCountField.val());
            var itemId = parseInt($buyCountField.data('itemid'));
            if(updating){
                clearTimeout(updating);
            }

            updating = setTimeout(function(){
                $.ajax({
                    url:'/shopping/cart/update',
                    data:{'itemId':itemId,'count': count},
                    dataType: 'json',
                    type: 'post',
                    success:function(result){
                        if(result.state == 1){

                        }else{
                            showMessage(result.msg)
                        }
                    }
                })
            },1000)
        }


        /**
         * 计算总价
         */

        function _countTotalPrice(){
            var totalPrice = 0;
            $('.products-list .product').each(function(){
                var $self = $(this);
                var $buyCountField = $('.buy-count',$self);
                var count = parseInt($buyCountField.val());
                var price = parseFloat($buyCountField.data('price'));

                var subTotal = count * price;

                totalPrice += subTotal;

            });

            $('.total-price .price').text('￥'+totalPrice.toFixed(2))
        }

        _countTotalPrice() //进入页面后算一次
    })
})(jQuery);