
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
})