pSlider = {

	rows: 2,
	lock: false,

	loadScroll: function() {

		var element_width, element_height, photo_columns, element, window_width;		
	
		function projects_init() {
			
			element = $('.recent-projects .projects div');
			
			elements = element.length;
			window_width = element.parent().parent().parent().width();

		
			if (window_width <= 320) {
			    photo_columns = 1;
			    pSlider.rows = 1;
			} else if (window_width <= 480) {
				photo_columns = 2;
				if(!pSlider.lock) { pSlider.rows = 2; }
			} else if (window_width <= 768) {
			    photo_columns = 3;
			    if(!pSlider.lock) {  pSlider.rows = 2; }
			} else if (window_width < 1200) {
			    photo_columns = 4;
			    if(!pSlider.lock) { pSlider.rows = 4; }
			} else {
			    photo_columns = 5;
			    if(!pSlider.lock) { pSlider.rows = 4; }
			}	
			
			element_width = window_width/photo_columns;
			element_height = element_width/1.611;

			element.width(element_width);
			element.height(element_height);
			
			element.parent().css({
				width:Math.floor((elements/pSlider.rows))*element_width
			}); 


			$('.recent-projects .prev, .recent-projects .next').css({
				top: ((element_height*pSlider.rows)-$('.recent-projects .prev').height())/2
			});
			
			element.parent().css({left:0});
			
		}
		
		$(window).resize(function() {
			projects_init()
		});
		
		function load_scroll() {
		
		
			projects_init();
			
			
			$('.recent-projects .prev').bind('click', function(e){
				e.preventDefault();
				return TurnLeft();
			});
		
			$('.recent-projects .next').bind('click', function(e){
				e.preventDefault();
				return TurnRight();
			});
			
			element.parent().parent().hover(function (e){
			
				e.preventDefault();
			
				$(this).stop(true,true);
				
				$('.recent-projects .prev:not(.disabled), .recent-projects .next:not(.disabled)').stop(true,true).fadeIn('fast')
			},function (e){
			
				e.preventDefault();
			
				$(this).stop(true,true);
				
				$('.recent-projects .prev, .recent-projects .next').stop(true,true).fadeOut('fast')
			})
		
			function TurnLeft() {
			
				current_pos = $('.projects').position().left;
				end_position = current_pos + element_width;
				
				if(current_pos == 0 || end_position > 0)
				{
					$('.recent-projects .prev').addClass('disabled').fadeOut();
					end_position = 0;
				}
				
				$('.recent-projects .next').removeClass('disabled').fadeIn();
				
				element.parent().animate({
					left: current_pos - 40
				}, 'fast', function(){
					$(this).animate({left:end_position})
				});
				
			}
			
			function TurnRight() {
			
				current_pos = element.parent().position().left;
				cont_width = element.parent().width();
				
				end_position = current_pos - element_width;
				
				if( current_pos == ( cont_width*(-1) ) + (photo_columns*element_width) || end_position < ( ( cont_width*(-1) ) + (photo_columns*element_width) ) )
				{
					$('.recent-projects .next').addClass('disabled').fadeOut();
					end_position = ( cont_width*(-1) ) + (photo_columns*element_width);
				}
				
				$('.recent-projects .prev').removeClass('disabled').fadeIn();
				
				element.parent().animate({
					left: current_pos + 40
				}, 'fast', function (){
					$(this).animate({left:end_position})
				});
				
			}
		}
		
		load_scroll()
		
	}
}