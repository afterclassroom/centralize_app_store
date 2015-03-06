$(document).ready(function (){
	$('.autoLoadContent').each(function(){
		var obj = $(this);
		var src = obj.data('href');
		$.get(src, {}, function(res){
			obj.html(res);
            var apiLink = obj.find('#api_link');
            apiLink.replaceWith(apiLink.text());
		});

	});
    $(".scrollToContent").click(function (){
    	var $scrollTo = $(this).data('href');
        //$(this).animate(function(){
            $('html, body').animate({
                scrollTop: $("#"+$scrollTo).offset().top
            }, 200);
        //});
    });
});