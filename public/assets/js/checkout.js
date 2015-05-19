(function ($) {

    /**
     page:load  turbolinks.js 事件
     */
    $(document).on('ready',function () {
        function openAddList(){
            $('html').addClass('noscroll')
            $('#addresses-list-wrapper').addClass('move-left')
        }
        function closeAddList(){
            $('html').removeClass('noscroll')
            $('#addresses-list-wrapper').removeClass('move-left')
        }

        $('#address-detail-wrapper').on('tap',openAddList)
        $('#move-back').on('tap',closeAddList)

        $('.addresses-list .order-address').on('tap',function(){
            $('.addresses-list .order-address').removeClass('active')
            $(this).addClass('active')
            var addid = $(this).data('addid')
            var $address = $(this).html()
            $('#address-detail-wrapper').html($address)
            $('.address-field').val(addid)
            closeAddList()
        })



        //toggle invoice
        $('.invoice-wrapper .invoice-field').on('ifChanged',function(){
            $('.invoice-detail').slideToggle(300)
        })
        $('.invoice-wrapper .invoice-field').on('ifChecked',function(){
            $('.invoice-detail').show()
        })


        //Submit

        $('#submit-order').on('tap',function(){
           $('#confirm-order-form').submit();
        });
    })

})(jQuery)