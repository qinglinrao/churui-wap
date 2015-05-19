/*pic 图片滚动*/
$(function(){
var navliw=0,linum=$("#scroller li");
for(i=0;i<linum.length;i++){
   navliw += linum.eq(i).outerWidth();
}
$("#scroller").width(navliw);
$(window).load(function(){
  var myScroll;
  myScroll = new IScroll('#bottom-pic', { eventPassthrough: true, scrollX: true, scrollY: false, preventDefault: false });
})
})