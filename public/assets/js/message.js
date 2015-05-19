/**
 * Created by hardywen on 15/1/6.
 */

/**
 * 在屏幕中间显示消息,并在一定时间后消失
 * @param message 显示的消息
 * @param time 显示时间（毫秒）默认1500
 */
function showMessage(message,time){
    var time = time ? time : 1500;
    var $messageWrapper = $('#message-wrapper');
    $('#message',$messageWrapper).html(message);
    $messageWrapper.show();
    setTimeout(function(){
        $messageWrapper.fadeOut(300);
    },time);
}
