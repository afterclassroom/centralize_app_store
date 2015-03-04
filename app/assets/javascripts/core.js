function validateEmail(email) {
	var reg = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return reg.test(email);
}

$(document).ready(function(){

	$('#btnDownloadApi').click(function(){
		swal("Coming soon!", "gotoClassroom’s App Store has a planned release for January 30, 2015. The store will feature powerful tools for users to enrich their educational experience. Our fully integrated and documented API invites all developers to create solutions for users. Currently, the API is available for developers to begin building applications by contacting app@gotoclassroom.com.");
	});

	/*** Switch Sign In/Up Form ***/
	// $('.link-switch').bind('click', {}, function(){
	// 	var target = $(this).data('target');

	// 	$(this).parent().show().fadeOut(500, function(){
	// 		$('#'+target).fadeIn(500);
	// 	})
	// });

	/*** Signup ***/

	var baseUrl = location.hostname;
	var fullBaseUrl = location.protocol+'//'+baseUrl;
	var dashboard_url = 'http://gotoclassroom.com/oauth/login_endpoint';
	$('#url_login').attr('href', dashboard_url);

	if (baseUrl == 'localhost'){
		fullBaseUrl = fullBaseUrl + ':' + location.port;
		dashboard_url = 'http://localhost:3000/oauth/login_endpoint';
		$('#url_login').attr('href', dashboard_url);
	}

	if (baseUrl == 'developer.afterclassroom.com'){
		dashboard_url = 'http://developer.afterclassroom.com/oauth/login_endpoint';
		$('#url_login').attr('href', dashboard_url);
	}

	/*
	*  Error handler
	*/
	var submitForm = {
		registerErrorHandler : function(meta){
			var meta_code = meta.code;
			var meta_message = meta.message;

			switch(meta_code){
				case "600":

				break;
				case "601":

				break;
				case "602":

				break;
				case "603":

				break;
			}

			for(i=0;i<3;i++) {
				swal("Error!", meta_message, "error");
			}
		}
	}

	/*
	*  Submit register form
	*/
	var registerForm = $('#signUpForm');
	var selectRole	 = registerForm.find('#userRole');
	var classcode  	 = registerForm.find('#classcode');

	var validator = registerForm.validate({
		rules: {
			fullname: {
				required: true,
				minlength: 3,
				maxlength: 100
			},
			email: {
				required: true,
				email: true
			},
			password: {
				required: true,
				minlength: 8,
				maxlength: 50
			},
			confirm: {
				required: true,
				equalTo: "#password"
			}
		},
		messages: {
			fullname: {
				required: "Please provide your name.",
				minlength: "Your name must be at least 3 characters long.",
				maxlength: "Please enter no more than 100 characters."
			},
			email: {
				required: "Please provide your email.",
				email: "Please enter a valid email.",
			},
			password: {
				required: "Please provide your password.",
				minlength: "Your password must be at least 8 characters long.",
				maxlength: "Please enter no more than 50 characters."
			},
			confirm: {
				required: "Please provide your confirm password.",
				equalTo: "Please enter the same value again."
			}
		}
	});


	$('#btnSignup').click(function () {

		if(validator.form()){

			/*** change button state ***/
			var btn = $(this);
			btn.button('loading');

			var selectVal  	 = selectRole.val();

			/*** check user role ****/
			var fullName    = registerForm.find('#fullname').val();
			var firstName   = fullName.split(' ').slice(0, -1).join(' ');
			var lastName    = fullName.split(' ').slice(-1).join(' ');
			var params      = {
				"email": registerForm.find('#email').val(),
				"first_name": firstName,
				"last_name": lastName,
				"password": registerForm.find('#password').val(),
				"password_confirmation": registerForm.find('#password').val(),
				"role": selectVal
			};

			var apiURL      = '';

			apiURL = fullBaseUrl+'/api/v1/users/create_user';


			$.ajax({
				type: "POST",
				url: apiURL,
				data: params,
				success: function(res){
					btn.button('reset');
					if(res.meta.code == 200){
						swal({
							title: "Done!",
							text: "Sign Up Successful.",
							type: "success",
							showCancelButton: false,
							closeOnConfirm: false,
						},
						function(){
							var subdomain = res.profile.sub_domain;
							if(selectVal == "teacher" || selectVal == "student"){
								window.location.href = location.protocol+'//'+subdomain + '.' + baseUrl;
							}else{
								window.location.href = dashboard_url;
							}
						});
					}else{
						submitForm.registerErrorHandler(res.meta);
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					btn.button('reset');
					swal("Op....", "You forgot to provide information that needed for the signing up. Please try again!", "error");
				}
			});

		}
	});

     /*
       *  Submit login form
       */
       $('#btnSignin').click(function(){
       	/**** change button state ****/
       	var btn = $(this);
       	btn.button('loading');

       	var apiURL = fullBaseUrl+"/oauth/login_json";
       	var params = {"email": $('#login_email').val(), "password": $('#login_password').val()};
       	$.ajax({
       		type: "POST",
       		url: apiURL,
       		data: params,
       		success: function(res){
       			if(res.access_token != '' && typeof res.access_token === 'string'){

       				var access_token = res.access_token;

       				var storage = new CrossStorageClient('http://dev.gotoclassroom.com/hub.html');
       				storage.onConnect().then(function() {
       					return storage.del('access_token');
       				}).then(function() {
       					return storage.set('access_token', res.access_token);
       				});

       				$.get(fullBaseUrl+':80/api/v1/users/me.json', {'access_token' : access_token}, function(res){
       					window.location.href = 'http://'+res.profile.sub_domain+'.gotoclassroom.com';
       				});

       				btn.button('reset');
       			}else{
       				btn.button('reset');
       				swal("Error!", "Something went wrong! Please retry later.", "error");
       			}
       		},
       		error: function(XMLHttpRequest, textStatus, errorThrown) {
       			btn.button('reset');
       			swal("Error!", "Something went wrong! Please retry later.", "error");
       		}
       	});
});

/*** Contact ***/
$(document).ready(function(){
	$('#contact-form').validate();
});

$('#send-contact').bind('click', {}, function(){

	if($('#contact-form').valid()){
		var btn = $(this)
		btn.button('loading');

		var params = $('#contact-form').serialize();
		$.post(fullBaseUrl+'/contacts/create_contact', params, function(res){
			swal("Thank you!", "You have message has been sent!", "success");
			btn.button('reset');
			$('#contact-form')[0].reset();
		});
	}
});

/*** Subscribe ***/
$('#btn-subscribe').bind('click', {}, function(){
	var btn = $(this)
	btn.button('loading');

	var mailvalid = validateEmail($("#txtEmail").val());

	if($("#txtEmail").val() !='' &&  mailvalid == false) {
		btn.button('reset');
		swal("Error!", "Please enter valid email address!", "error");
	}else{
		var params = $('#subscribe-form').serialize();
		$.post(fullBaseUrl+'/subscribe/create_subscribe', params, function(res){
			btn.button('reset');
			swal("Thank you!", "You have successfully subscribed to our newsletter!", "success");
			$('#subscribe-form')[0].reset();
		});
	}
});

/*** Retina Image Loader ***/
if ($.fn.unveil){
	$("img").unveil();
}

/**** Scroller ****/
if ($.fn.niceScroll){
	var mainScroller = $("html").niceScroll({
		zindex:999999,
		boxzoom:true,
		cursoropacitymin :0.5,
		cursoropacitymax :0.8,
		cursorwidth :"10px",
		cursorborder :"0px solid",
		autohidemode:false
	});
}

/**** Carousel for Testominals ****/
if ($.fn.owlCarousel){
	$("#testomonials").owlCarousel({
		singleItem:true
	});
}

/**** Mobile Side Menu ****/
if ($.fn.waypoint){
	var $head = $('#ha-header');
	$( '.ha-waypoint' ).each( function(i) {
		var $el = $( this ),
		animClassDown = $el.data( 'animateDown' ),
		animClassUp = $el.data( 'animateUp' );

		$el.waypoint( function( direction ) {
			if( direction === 'down' && animClassDown ) {
				$head.attr('class', 'ha-header ' + animClassDown);
			}
			else if( direction === 'up' && animClassUp ){
				$head.attr('class', 'ha-header ' + animClassUp);
			}
		}, { offset: '100%' } );
	});
}
/**** Revolution Slider ****/
if ($.fn.revolution){
	revapi = $('#home').revolution(
	{
		delay:15000,
		startwidth:1170,
		startheight:500,
		hideThumbs:10,
		fullWidth:"off",
		fullScreen:"on",
		navigationType:"none",
		fullScreenOffsetContainer: "",
		touchenabled :"on",
		videoJsPath:"assets/plugins/rs-plugin/videojs/"
	});
	tourSlider = $('#tourSlider').revolution(
	{
		delay:9000,
		startwidth:1170,
		startheight:550,
		hideThumbs:10,
		fullWidth:"on",
		forceFullWidth:"on"
	});
}

/**** Parrallax ****/
if ($.fn.parallax){
	$('#working-section').parallax("50%", 0.1,false);

	$('.parrallax-element, .parrallax-background').each(function () {
		$(this).css('background-image', 'url(' + $(this).attr("data-background-image") + ')');
		$(this).css('height',  $(this).attr("data-background-height"));
		$(this).css('width',  $(this).attr("data-background-width"));
		$(this).parallax("50%", 0.1);
	});
}

/**** Appear JS ****/
if ($.fn.appear){
	$('[data-ride="animated"]').appear();
	if( !$('html').hasClass('ie no-ie10') ) {
		$('[data-ride="animated"]').addClass('appear');
		$('[data-ride="animated"]').on('appear', function() {
			var $el = $(this), $ani = ($el.data('animation') || 'fadeIn'), $delay;
			if ( !$el.hasClass('animated') ) {
				$delay = $el.data('delay') || 0;
				setTimeout(function(){
					$el.removeClass('appear').addClass( $ani + " animated" );
				}, $delay);
			}
		});
	};
	$('.number-animator').appear();
	$('.number-animator').on('appear', function() {
		$(this).animateNumbers($(this).attr("data-value"), true, parseInt($(this).attr("data-animation-duration")));
	});

	$('.animated-progress-bar').appear();
	$('.animated-progress-bar').on('appear', function() {
		$(this).css('width', $(this).attr("data-percentage"));
	});
}

/**** Animate Numbers ****/
if ($.fn.animateNumbers){
	$('.animate-number').each(function(){
		$(this).animateNumbers($(this).attr("data-value"), true, parseInt($(this).attr("data-animation-duration")));
	})
}

$('.animate-progress-bar').each(function(){
	$(this).css('width', $(this).attr("data-percentage"));

})

if ($("#thumbs").length > 0){
	var $container = $('#thumbs');
	$container.isotope({
		filter: '*',
		animationOptions: {
			duration: 750,
			easing: 'linear',
			queue: false
		}
	});

	$(window).resize(function() {
		var $container = $('#thumbs');
		$container.isotope({
			itemSelector : '.item',
			animationOptions: {
				duration: 250,
				easing: 'linear',
				queue: false
			}
		});
	});


	/**** filter items when filter link is clicked ****/
	$('#portfolio-nav a, #gallery-nav a').click(function(){
		var selector = $(this).attr('data-filter');
		$container.isotope({ filter: selector });

		$("#portfolio-nav li, #gallery-nav li").removeClass("current");
		$(this).closest("li").addClass("current");

		return false;
	});
}



$(".portfolio-grid ul li").hover(function(){
	var imgHeight=$(this).find("img").height();
	$(this).find(".portfolio-image-wrapper").height(imgHeight);

});

});

function getUrlParameters(){
	var url = window.location.href;
	var sURLVariables = url.split('#');
	return sURLVariables[1];
}

$(document).ready(function(){

	var jsonData = [];
	var key = getUrlParameters();
	if (key != undefined && key != ''){
		var random = Math.random();
		$.getJSON("/homepage/js/help.json?ran="+random, function(data) {
			jsonData = data;
			$('#help-title').html(jsonData[key]['title']);
			$('#help-content').html(jsonData[key]['content']);
			if (jsonData[key]['image'][0] != undefined){
				$('#help-image').attr('src', jsonData[key]['image'][0]['url']);
			}
		});
	}

	$('.help-list').click(function(){
		var href = $(this).attr('href');
		var sURLVariables = href.split('#');
		var new_key = sURLVariables[1];

		if (new_key != undefined && new_key != '' && new_key != key){
			key = new_key;
			$('#help-image').removeAttr('src');

			if (jsonData.length == 0){
				var random = Math.random();
				$.getJSON("/homepage/js/help.json?ran="+random, function(data) {
					jsonData = data;
				});
			}

			$('#help-title').html(jsonData[key]['title']);
			$('#help-content').html(jsonData[key]['content']);
			if (jsonData[key]['image'][0] != undefined){
				$('#help-image').attr('src', jsonData[key]['image'][0]['url']);
			}

			$("html, body").animate({
				scrollTop: 0
			}, 600);
		}
	});

	$('.press-coming-soon').click(function(){
		swal("Warning!", "Coming soon.", "warning");
	});


});