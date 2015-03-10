$(document).ready(function() {
	/*** begin Contact ***/
	$('#contact-form').validate();

	$('#send-contact').bind('click', {}, function(){

		if($('#contact-form').valid()){
			var btn = $(this)
			btn.button('loading');

			var params = $('#contact-form').serialize();
			$.post('/contacts/create_contact', params, function(res){
				swal("Thank you!", "You have message has been sent!", "success");
				btn.button('reset');
				$('#contact-form')[0].reset();
			});
		}
	});
	/*** end Contact ***/


	/*** begin Subscribe ***/
	$('#btn-subscribe').bind('click', {}, function(){
		var btn = $(this)
		btn.button('loading');

		var mailvalid = validateEmail($("#txtEmail").val());

		if($("#txtEmail").val() !='' &&  mailvalid == false) {
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
	});
	/*** end Subscribe ***/

})