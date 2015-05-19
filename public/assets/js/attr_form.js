/**
 * Created by hardywen on 15/1/5.
 */

(function($){
    $(document).on('ready',function(){
        // AttrForm 变量在 app/views/products/_attributes.blade.php 定义并赋值

        //get shopping cart items count
        $.ajax({
            url:'/shopping/cart/count',
            dataType:'json',
            success:function(result){
                $('.cart-prod-num span').text(result);
            }
        })

        var $allOptions = $('#product-attributes .option');

        //选择参数功能
        $allOptions.on('tap',function(){

            var $option = $(this);  //点击的当前元素就是选的参数
            var optId = parseInt($option.data('optid'));  //参数id
            var optValId = parseInt($option.data('optvalid'));  //参数值id

            if($option.hasClass('disabled')) return;  //如果参数不可选，直接返回

            if($option.hasClass('selected')){
                delete(AttrForm.selectedIds[optId]); //将当前点击参数从【选中参数数组】中移除
            }else{
                AttrForm.selectedIds[optId] = optValId;  //将选择的选项加入【选中参数数组】
                $('[data-optid="'+optId+'"]').removeClass('selected');
            }
            $option.toggleClass('selected');

            updateOptionsStatus();//更新所有选项的可点击状态
            updatePrice(); //更新价格
        })


        /**
         * 更新选项的可选状态所用到的方法-----------------start--------------------------------------
         */
        function updateOptionsStatus(){
            $allOptions.each(function(){

                if($(this).hasClass('selected')) return //如果已是选中状态，不必再做判断

                var $option = $(this);
                var optId = parseInt($option.data('optid'));  //参数id
                var optValId = parseInt($option.data('optvalid'));  //参数值id
                var optionSet = $.extend({}, AttrForm.selectedIds); // 复制【选中参数数组】

                optionSet[optId] = optValId; //产生一个新的组合，以此判断此组合是否存在并且有库存，如果为真则些选项是可选的，否则是不可选的。

                $option.addClass('disabled');
                if(_checkOptionSet(optionSet)){
                    $option.removeClass('disabled');
                }

            })
        }

        function _checkOptionSet(optionSet){
            for(i in AttrForm.productEntities){
                var entity = AttrForm.productEntities[i];
                var setStr = entity.option_set; //字符串，格式如： |1|43|11|...|
                var stock = parseInt(entity.stock); //库存

                if(stock > 0 && _checkSet(optionSet,setStr)) return true;
            }
            return false;
        }

        function _checkSet(optionSet,setStr){
            for(i in optionSet){
                if(setStr.indexOf('|'+optionSet[i]+'|') < 0) return false;
            }
            return true;
        }
        /**
         * 更新选项的可选状态所用到的方法------------------end---------------------------------------
         */


        /**
         * 更新价格及库存所用到的方法-----------------------start-----------------------------------
         */
        function updatePrice(){
            var prices = _getPrices();
            var maxPrice = Math.max.apply(Math,prices);
            var minPrice = Math.min.apply(Math,prices);
            var priceStr;

            if(maxPrice == minPrice){
                priceStr = '￥'+maxPrice.toFixed(2);
            }else{
                priceStr = '￥'+minPrice.toFixed(2)+' ~ '+maxPrice.toFixed(2);
            }

            $('#sale-price').text(priceStr);
            $('#total-stock').text(AttrForm.totalStock);
        }

        function _getPrices(){
            var prices = new Array();
            var entityIds = new Array();
            var totalStock = 0;
            for(i in AttrForm.productEntities){

                var entity = AttrForm.productEntities[i];
                var price = parseFloat(entity.sale_price).toFixed(2);
                var setStr = entity.option_set; //字符串，格式如： |1|43|11|...|
                var stock = parseInt(entity.stock); //库存
                var entityId = entity.id;

                if(stock > 0 && _checkSet(AttrForm.selectedIds,setStr)){
                    prices.push(price);
                    totalStock += stock;
                    entityIds.push(entityId);
                }
            }

            AttrForm['totalStock'] = totalStock; //算出总库存
            _checkBuyCount(false)

            if(entityIds.length == 1 && _selectComplete){
                AttrForm['entityId'] = entityIds[0];
            }else{
                AttrForm['entityId'] = 0;
            }

            return prices
        }

        function _selectComplete(){
            var count = 0;
            for(i in AttrForm.selectedIds){
                if(AttrForm.selectedIds[i])
                    count += 1;
            }
            console.log(count , AttrForm.optionsCount)
            return count == AttrForm.optionsCount;
        }
        /**
         * 更新价格所用到的方法----------------------------end--------------------------------------
         */


        /**
         * 更改购买数量---------------------------------start--------------------------------------
         */
        $('.buy-count-form span').on('click',function(){
            var count = parseInt($('#buy-count').val())
            if($(this).hasClass('sub')){
                count = count <= 1 ? 1 : count - 1;
            }else{
                count += 1;
            }
            if(count > AttrForm.totalStock){
                count = AttrForm.totalStock;
                alert('您购买的数量超过了商品库存！');
            }
            $('#buy-count').val(count)
        });

        $('#buy-count').on('change',function(){
            _checkBuyCount(true)
        })
        function _checkBuyCount(showError){
            var count = parseInt($('#buy-count').val());
            if(count > AttrForm.totalStock){
                count = AttrForm.totalStock;
                if(showError)
                    alert('此商品库存仅剩'+count+'件');
                $('#buy-count').val(count);
            }
        }

        /**
         * 更改购买数量---------------------------------end----------------------------------------
         */
    })
})(jQuery)
