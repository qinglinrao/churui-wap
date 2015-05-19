/**
 * Created by hardywen on 14/11/21.
 */
(function ($) {

    /**
     page:load  turbolinks.js 事件
     */
    $(document).on('ready',function () {

        // toggle password field to text field----------------------------------------------
        $('.toggle-password-text').on('tap', function () {
            var $passwordField = $($(this).data('target'))
            if($passwordField.attr('type') == 'text'){
                $passwordField.attr('type','password')
            }else{
                $passwordField.attr('type','text')
            }

        })

        //顾客注册下一步
        $('#next-step').on('click',function(){
            var phone = $("[data-role='phone']").val()
            var mobile = /^(((1(3|4|5|7|8)[0-9]{1}))+\d{8})$/
            if(phone.length != 11 || !mobile.test(phone)){
                alert('请输入正确的手机号码')
                return;
            }
            if(!$('#termcheck').prop('checked')){
                alert('您需要同意用户注册协议才能继续注册')
                return;
            }
            $.ajax({
                url: '/customer/register_check',
                data:{'mobile':phone},
                dataType: 'json',
                type: 'post',
                beforeSend:function(){
                    $(this).attr('disabled','disabled');
                },
                success: function(result){
                    //console.info(result);
                    if(result.state == 1){
                        $('#step-1').addClass('hide')
                        $('#step-2').removeClass('hide')
                    }else{
                        alert(result.msg)
                    }
                    $(this).removeAttr('disabled');
                },
                error: function(){
                    alert('系统出错')
                    $(this).removeAttr('disabled');
                }
            })

            return false;
        })


        // 商家注册的第一个下一步
        $('#next-step-one').on('click',function(){
            var phone = $("[data-role='phone']").val()
            var mobile = /^(((1(3|4|5|7|8)[0-9]{1}))+\d{8})$/
            var authcode = $.trim($('#authcode').val());
            if(phone.length != 11 || !mobile.test(phone)){
                alert('请输入正确的手机号码')
                return;
            }
            if(authcode == null || authcode == ""){
                alert('请输入验证码!');
                return ;
            }
            if(!$('#termcheck').prop('checked')){
                alert('您需要同意用户注册协议才能继续注册')
                return;
            }
            $.ajax({
                url: '/merchant/register_check',
                data:{'mobile':phone,'authcode':authcode},
                dataType: 'json',
                type: 'post',
                beforeSend:function(){
                    $(this).attr('disabled','disabled');
                },
                success: function(result){
                    console.info(result)
                    if(result.state == 1){
                        $('#step-1').addClass('hide')
                        $('#step-2').removeClass('hide')
                        $('#page-title').html('设置密码')
                    }else{
                        alert(result.msg)
                    }
                    $(this).removeAttr('disabled');
                },
                error: function(){
                    alert('系统出错')
                    $(this).removeAttr('disabled');
                }
            })

            return false;
        })


        // 商家注册的第二个下一步
        $('#next-step-two').on('click',function(){
            var password = $.trim($('#password').val());
            var repassword = $.trim($('#repassword').val());
            var pwd_reg = /^[A-Za-z0-9]{6,20}$/
            if(password == null || password == ""){
                alert('请输入密码');
                return ;
            }else if(!pwd_reg.test(password)){
                alert('密码须由6~20字母或数字组成!');
                return ;
            }else if(repassword != password){
                alert('两次输入的密码不一致！');
                return ;
            }else{
                $('#step-1').addClass('hide')
                $('#step-2').addClass('hide')
                $('#step-3').removeClass('hide')
            }

        })

        $('')


        //get auth code----------------------------------------------------------------

        $('#get-register-code').on('click',function(){
            var timeLeft = 60;
            var $self = $(this)
            if($self.hasClass('got')) return

            $self.addClass('got')
            var phone = $.trim($("[data-role='phone']").val());
            $.ajax({
                url: '/authcode',
                data:{'mobile':phone},
                dataType: 'json',
                type: 'post',
                beforeSend:function(){
                    $self.text('加载中...')
                },
                success: function(result){
                    console.info(result);
                    if(result.state == 1){
                        var countDown = setInterval(function(){
                            timeLeft--;
                            if(timeLeft == 0){
                                clearInterval(countDown)
                                $self.text('获取验证码')
                                $self.removeClass('got')
                            }else{
                                $self.text('('+timeLeft+')重新获取')
                            }
                        },1000)
                    }else{
                        alert(result.msg);
                        $self.text('获取验证码')
                        $self.removeClass('got')
                    }
                }
            })
        })


        //toggle order detail ----------------------------------------------------
        $('.toggle-button').on('click',function(){
            var $self = $(this).find('span')
            $('.order-detail-info').slideToggle(300,function(){
                if($self.text() == '交易详情'){
                    $self.text('收起')
                }else{
                    $self.text('交易详情')
                }
            })
        })

       //post register form
        $('#new_merchant #submit-btn').click(function(){
            var identity_num = $.trim($('#identity_num').val());
            var real_name = $.trim($('#realname').val());
            var id_reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
            if(identity_num == null || identity_num == "" || !id_reg.test(identity_num)){
                alert('请输入正确的身份证号!');
                return false;
            }else if(real_name == null || real_name == ""){
                alert('请输入姓名!');
                return false;
            }else{
                $('#new_merchant').submit();
            }

        });

        //post login request
        $('form#customer-login').submit(function(){

            var phone = $.trim($("#customer_login").val());
            var password = $.trim($('#customer_password').val());
            $self_submit_btn = $(this).find('input#submit-btn') ;
            if(phone == "" || password == ""){
                return false;
            }
            $.ajax({
                url: $(this).attr('action'),
                data:{'mobile':phone,'password':password},
                dataType: 'json',
                type: 'post',
                beforeSend:function(){
                    $self_submit_btn.val('登录中...');
                },
                success: function(result){
                    if(result.state == 1){
                        //window.setTimeout(function(){
                        //    window.location.href = '/customers/profile';
                            window.location.href = result.msg;
                        //},2000);
                    }else{
                        $self_submit_btn.val('登录');
                        $self_submit_btn.removeClass('got');
                        //$('span#login-tip').text(result.msg);
                        //alert(result.msg);
                        $('p.form-tip').html(result.msg);
                        autoHideFormTip(3500);

                    }
                },
                error :function(){
                    $self_submit_btn.val('完成');
                    $self_submit_btn.removeClass('got');
                    $('span#auth-code-tip').text("系统错误");
                }
            });
            return false;
        });


        //update customer phone info
        $('form#profile-phone').submit(function(){
            var phone = $("[data-role='phone']").val()
            var mobile = /^(((1(3|4|5|7|8)[0-9]{1}))+\d{8})$/
            if(phone.length != 11 || !mobile.test(phone)){
                $('p.form-tip').html('请输入正确的手机号码');
                autoHideFormTip(3500);
                return false;
            }else{

                return true;
            }
        })


        $('#get-phone-code').on('click',function(){
            var timeLeft = 60;
            var $self = $(this)
            if($self.hasClass('got')) return


            var phone = $("[data-role='phone']").val()
            var mobile = /^(((1(3|4|5|7|8)[0-9]{1}))+\d{8})$/
            if(phone.length != 11 || !mobile.test(phone)){
                $('p.form-tip').html('请输入正确的手机号码');
                autoHideFormTip(3500);
                return false;
            }
            $self.addClass('got')
            $.ajax({
                url: '/authcode',
                data:{'mobile':phone},
                dataType: 'json',
                type: 'post',
                beforeSend:function(){
                    $self.text('加载中...')
                },
                success: function(result){
                    if(result.state == 1){
                        var countDown = setInterval(function(){
                            timeLeft--;
                            if(timeLeft == 0){
                                clearInterval(countDown)
                                $self.text('获取验证码')
                                $self.removeClass('got')
                            }else{
                                $self.text('('+timeLeft+')重新获取')
                            }
                        },1000)
                    }else{
                        //alert();
                        $('p.form-tip').html(result.msg);
                        autoHideFormTip(3500);
                        $self.text('获取验证码')
                        $self.removeClass('got')
                    }
                },
                error: function(){
                    //alert('网络错误')
                    $('p.form-tip').html('网络错误');
                    autoHideFormTip(3500);
                    $self.text('获取验证码')
                    $self.removeClass('got')
                }
            })
        })

        $('input#profile-image').change(function(){
           $(this).closest('form').submit();
        })

        $('.address-default-radio').on('click',function(){
            if(!$(this).closest('.iradio').hasClass('checked')){
                //$('.iradio').removeClass('checked');
                //$(this).closest('.iradio').addClass('checked');
                $(this).closest('form').submit();
            }

        })

        //订单评价
        $("ul.five-star li.start").click(function(){
            $(this).closest('ul.five-star').find('li.active').removeClass('active');
            $(this).prevAll('li.start').addClass('active');
            $(this).addClass('active');
            $(this).closest('ul.five-star').next('input.start-num').val( $(this).closest('ul.five-star').find('li.active').size())
        })

        //会员成长进度条
        $bar_left = $('.level-info td.second div.left').html();
        $bar_right = parseInt($('.level-info td.second div.right').html());
        $bar_cur = parseInt($('.level-info td.second .level-bar').html());
        $bar_width = ($bar_cur - $bar_left) / ($bar_right - $bar_left);
        $(".level-info td.second .level-bar").css({'width':$bar_width*100+'%','text-align':'center'});

        //忘记密码 表单提交
        $('form#forget_password').submit(function(){
            var mobile = $.trim($('#merchant_mobile').val());
            var authcode = $.trim($('#merchant_authcode').val());
            var password = $.trim($('#merchant_password').val());
            var repassword = $.trim($('#merchant_repassword').val());
            var mobile_reg = /^(((1(3|4|5|7|8)[0-9]{1}))+\d{8})$/
            var pwd_reg = /^[A-Za-z0-9]{6,20}$/
            if(mobile == null || mobile == "" || !mobile_reg.test(mobile)){
                alert('请输入正确的手机号码');
                return false;
            }else if(authcode == null || authcode == ""){
                alert('请输入验证码');
                return false;
            }else if(password == null || password == ""){
                alert('请输入密码');
                return false;
            }else if(!pwd_reg.test(password)){
                alert('密码须由6~20位字母或数字组成!');
                return false;
            }else if(repassword != password){
                alert('两次确认的密码不一致!');
                return false;
            }else{
                return true;
            }
        })


        //顾客注册
        $('#new_customer').submit(function(){
            var phone = $.trim($("[data-role='phone']").val());
            var authcode = $.trim($('#authcode').val());
            var password = $.trim($('#customer_password').val());
            var merchant_id = $.trim($('#merchant_id').val());
            $self_submit_btn = $('input#submit-btn') ;
            if(authcode == "" || password == ""){
                return false;
            }
            $.ajax({
                url: $(this).attr('action'),
                data:{'mobile':phone,'password':password,'authcode':authcode,'merchant_id':merchant_id},
                dataType: 'json',
                type: 'post',
                beforeSend:function(){
                    $self_submit_btn.val('注册中...');
                },
                success: function(result){
                    if(result.state == 1){
                        window.location.href = result.msg;
                    }else{
                        $self_submit_btn.val('完成');
                        $self_submit_btn.removeClass('got');
                        alert(result.msg);
                    }
                },
                error :function(){
                    $self_submit_btn.val('完成');
                    $self_submit_btn.removeClass('got');
                    alert('系统错误!');
                }
            });
            return false;
        });





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


    })
}) (jQuery)
