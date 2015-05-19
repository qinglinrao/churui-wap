$(document).ready(function(){
	mymedia();
	});
$(window).resize(function(){
		mymedia();
		});


	var mymedia=function(){
		var winw=$(window).width(),p=winw/640;
		if(320 > winw){
			$("html").css("fontSize","12.5px");
		}
		if( winw>=320 && 640 >= winw){
			$("html").css("fontSize",25*p);
		}
		if(winw>640){
		    $("html").css("fontSize","25px");
		}		
	}