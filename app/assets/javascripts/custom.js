(function ($){ $(function(){


/** Footer Twitts **/

function InOut( elem )
{
	elem
	.fadeIn()
	.delay(5000)
	.fadeOut(function(){if(elem.next().length > 0){InOut( elem.next() );}else{InOut( elem.siblings(':first'));}});
}

setTimeout(function (){
	$('#foot-twitts li').hide();
	InOut( $('#foot-twitts li:first') );
}, 3000)



/** Go To Top Page Link **/

$('.to-top').click(function(){
    $("html, body").stop(true, true).animate({ scrollTop: 0 }, 600);
    return false;
});



/** Blog Images Animation **/

$('.blog-posts .head-image, .fancybox').hover(function (){
	$(this).stop(true, true).animate({ opacity:0.5 }, 600);
}, function(){
	$(this).stop(true, true).animate({ opacity:1 }, 600);
})


/** Portfolio Share **/

$('.share').popover('hide');
$('.share').click(function (e){
	e.preventDefault()
});



/** Single Portfolio Overlay **/

$('.single-portfolio-video .similiar div').hover(function (){

	var t = $(this);

	var img_w = t.find('img').width();
	var img_h = t.find('img').height();


	type = t.find('img').attr('data-type');

	if(type=='movie')
	{
		icon = 'play-circle';
	} else {
		icon = 'plus'
	}

	t.append(
		$('<a href="#"></a>').addClass('overlay')
		.append(
			$('<i class="icon-'+icon+' icon-2x"></i>').css({
				'position':'relative',
				top:(img_h-24)/2,
				left:(img_w-24)/2
			})
		)
	);


	t.find('.overlay').css({
		width:img_w,
		height:img_h,
		top:0
	}).fadeIn('fast');




},function(){

	var t = $(this);

	t.find('.overlay').stop(true,true).remove();

});




/** Latest Blog Posts Overlay **/

$('.latest-blog-posts .posts .post .animate').hover(function (){
	$(this).stop(true, true).animate({ opacity:0.5 }, 600);
}, function(){
	$(this).stop(true, true).animate({ opacity:1 }, 600);
})



/** Masonry Portfolio Overlay Function **/

$("#masonry").on(
{
    mouseenter: function()
    {
		var t = $(this);

		var img_w = t.find('img').width();
		var img_h = t.find('img').height();


		type = t.find('img').attr('data-type');

		if(type=='movie')
		{
			icon = 'play-circle';
		} else {
			icon = 'plus'
		}

		t.append(
			$('<a href="'+t.find('img').attr('data-link')+'" title=""></a>').addClass('overlay')
			.append(
				$('<i class="icon-'+icon+' icon-2x"></i>').css({
					'position':'relative',
					top:(img_h-24)/2,
					left:(img_w-24)/2
				})
			)
		);


		t.find('.overlay').css({
			width:img_w,
			height:img_h,
			top:1,
			left:1
		}).fadeIn('fast');
    },
    mouseleave: function()
    {
		var t = $(this);

		t.find('.overlay').stop(true,true).remove();
    }
}, ".box");




/** Overlay Function **/
$('.recent-projects .project').hover(function (){

	var t = $(this);

	t.append(
		$('<div></div>').addClass('overlay')
		.append(
			$('<a></a>')
			.addClass('title')
			.attr('href', t.attr('data-link') )
			.html( t.attr('data-title') )
		)
		.append(
			$('<a></a>')
			.addClass('link')
			.attr('href', t.attr('data-link') )
			.html( '<i class="icon-plus"></i> ' + t.attr('data-link-title') )
		)
	);


	var img_w = t.width();
	var img_h = t.height();

	t.find('.overlay').css({
		width:img_w,
		height:0,
		top:0
	});

	t.find('.overlay').stop(true,true).animate({height:img_h});



},function(){

	var t = $(this);

	t.find('.overlay').stop(true,true).animate({height:0}).remove();

});



/** Frontpage Services Animation **/

$('.services .header .service-header').hover(function (){

	var t = $(this);

	t.find('h3').hide();

	$(this).parent().find('.header-bg').stop(true,true).animate({
		width: '100%'
	}, 'fast', function (){ t.find('h3').addClass('active').fadeIn('fast') })

},function (){

	var t = $(this);

	t.find('h3').hide();

	t.parent().find('.header-bg').stop(true,true).animate({
		width: 70
	}, 'fast', function (){ t.find('h3').removeClass('active').fadeIn('fast') });
});




/** Social Icons animation **/

$('.footer-bot .to-top').hover(function (){

	$(this).find('i').stop(true,true).delay(200).animate({
		top:-60
	}, 'fast', function (){
		$(this)
			.css({
				top:120,
				'position':'relative'
			})
			.animate({top:0})
	})

},function (){

	$(this)
		.find('i')
		.stop(true,true)
		.animate({
		'position':'relative',
		top:0
		})
		.removeClass('active')
});




/** Fancybox initialize **/

$(".fancybox").fancybox({
    	openEffect	: 'elastic',
    	closeEffect	: 'elastic'
});



/** Instagram Photo Widget **/
$('#instagram').on('hover', 'li', function (){

	var t = $(this);
	$('#instagram li').not(this).fadeTo('slow', 0.5);
	t.stop(true,true).fadeTo('fast', 1);

});

$('#instagram').mouseleave(function() {
  $(this).find('li').stop(true,true).fadeTo('fast', 1);
});



/** Flickr Photo Widget **/
$('#flickr').on('hover', 'li', function (){

	var t = $(this);
	$('#flickr li').not(this).fadeTo('slow', 0.5);
	t.stop(true,true).fadeTo('fast', 1);

});

$('#flickr').mouseleave(function() {
  $(this).find('li').stop(true,true).fadeTo('fast', 1);
});


/** Mobile Select Menu **/
$('#menu').bind('change', function () {
  var url = $(this).val();
  if (url) {
      window.location = url;
  }
  return false;
});





}) })(jQuery);