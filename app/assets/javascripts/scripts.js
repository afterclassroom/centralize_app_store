function validateEmail(email) {
	var reg = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return reg.test(email);
}

$(document).ready(function() {

	/***************** Waypoints ******************/

	$('.wp1').waypoint(function() {
		$('.wp1').addClass('animated fadeInLeft');
	}, {
		offset: '75%'
	});
	$('.wp2').waypoint(function() {
		$('.wp2').addClass('animated fadeInDown');
	}, {
		offset: '75%'
	});
	$('.wp3').waypoint(function() {
		$('.wp3').addClass('animated bounceInDown');
	}, {
		offset: '75%'
	});
	$('.wp4').waypoint(function() {
		$('.wp4').addClass('animated fadeInDown');
	}, {
		offset: '75%'
	});

	/***************** Flickity ******************/

	$('#featuresSlider').flickity({
		cellAlign: 'left',
		contain: true,
		prevNextButtons: false
	});

	$('#showcaseSlider').flickity({
		cellAlign: 'left',
		contain: true,
		prevNextButtons: false,
		imagesLoaded: true
	});

	/***************** Fancybox ******************/

	$(".youtube-media").on("click", function(e) {
		var jWindow = $(window).width();
		if (jWindow <= 768) {
			return;
		}
		$.fancybox({
			href: this.href,
			padding: 4,
			type: "iframe",
			'href': this.href.replace(new RegExp("watch\\?v=", "i"), 'v/'),
		});
		return false;
	});


	$("a.single_image").fancybox({
		padding: 4,
	});


	/***************** Nav Transformicon ******************/

	/* When user clicks the Icon */
	$(".nav-toggle").click(function() {
		$(this).toggleClass("active");
		$(".overlay-boxify").toggleClass("open");
	});

	/* When user clicks a link */
	$(".overlay ul li a").click(function() {
		$(".nav-toggle").toggleClass("active");
		$(".overlay-boxify").toggleClass("open");
	});

	/* When user clicks outside */
	$(".overlay").click(function() {
		$(".nav-toggle").toggleClass("active");
		$(".overlay-boxify").toggleClass("open");
	});

	/***************** Smooth Scrolling ******************/
	$('a[href*=#]:not([href=#])').click(function() {
		if (location.pathname.replace(/^\//, '') === this.pathname.replace(/^\//, '') && location.hostname === this.hostname) {

			var target = $(this.hash);
			target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
			if (target.length) {
				$('html,body').animate({
					scrollTop: target.offset().top
				}, 2000);
				return false;
			}
		}
	});

	/*** Subscribe ***/
	$('#btn-subscribe').bind('click', {}, function(){

		var btn = $(this)
		btn.button('loading');

		var email_val = $("#txtEmail").val();

		if(email_val =='') {
			btn.button('reset');
			swal("Error!", "Please enter an email address!", "error");
		}
		else {
			var mailvalid = validateEmail(email_val);
			if(mailvalid == false) {
				btn.button('reset');
				swal("Error!", "Please enter valid email address!", "error");
			}else{
				var params = $('#subscribe-form').serialize();
				$.post('/subscribe/create_subscribe', params, function(res){
					btn.button('reset');
					swal("Thank you!", "You have successfully subscribed to our newsletter!", "success");
					$('#subscribe-form')[0].reset();
				});
			}
		}
	});

	/*****  get free lsm form  *******/
	$('#get-lms-form').validate();

	$('#btn-get-lms').bind('click', {}, function(){

		if($('#get-lms-form').valid()){
			var btn = $(this)
			btn.button('loading');

			var params = $('#get-lms-form').serialize();
			$.post('/contacts/create_source_code', params, function(res){
				swal("Thank you!", "Your order has been received. It takes us about 2 business days to process your order. Thank you for your patience.", "success");
				btn.button('reset');
				$('#get-lms-form')[0].reset();
				$('#myModal').modal('hide');
			});
		}
	});

});

		$(function(){

			$('.nested, #table3').tablesorter({
				widthFixed : true,
				showProcessing: true,
		//headerTemplate : '{content} {icon}', // Add icon for various themes

		widgets: [ 'zebra', 'stickyHeaders' ],

		widgetOptions: {

			// extra class name added to the sticky header row
			stickyHeaders : '',
			// number or jquery selector targeting the position:fixed element
			stickyHeaders_offset : 0,
			// added to table ID, if it exists
			stickyHeaders_cloneId : '-sticky',
			// trigger "resize" event on headers
			stickyHeaders_addResizeEvent : true,
			// if false and a caption exist, it won't be included in the sticky header
			stickyHeaders_includeCaption : true,
			// The zIndex of the stickyHeaders, allows the user to adjust this to their needs
			stickyHeaders_zIndex : 2,
			// jQuery selector or object to attach sticky header to
			stickyHeaders_attachTo : null,
			// jQuery selector or object to monitor horizontal scroll position (defaults: xScroll > attachTo > window)
			stickyHeaders_xScroll : null,
			// jQuery selector or object to monitor vertical scroll position (defaults: yScroll > attachTo > window)
			stickyHeaders_yScroll : null,

			// scroll table top into view after filtering
			stickyHeaders_filteredToTop: true

			// *** REMOVED jQuery UI theme due to adding an accordion on this demo page ***
			// adding zebra striping, using content and default styles - the ui css removes the background from default
			// even and odd class names included for this demo to allow switching themes
			// , zebra   : ["ui-widget-content even", "ui-state-default odd"]
			// use uitheme widget to apply defauly jquery ui (jui) class names
			// see the uitheme demo for more details on how to change the class names
			// , uitheme : 'jui'
		}
	});

});