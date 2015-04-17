
// function formatText2Html(s){console.log(s);
//     $this = jQuery('<div/>');
//     $this.html(s);
//     return $this.text();
// }

function getUrlParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam)
        {
            return sParameterName[1];
        }
    }
}
jQuery(function() {

    var animEl = document.querySelector( '.la-anim-1' );

    //load tumblr api - http://api.tumblr.com/v2/blog/phapsu.tumblr.com/likes?api_key=SdN1SYWaD21YCFvsHHWmoDCdEZoVRBq1D5JIsuDn2XyBQi0u6o
    var tumblr_url = 'http://api.tumblr.com/v2/blog/gotoclassroom.tumblr.com/posts';
    var tumblr_api_key = '1nuqaEALkp3QUgNxrt0yeSoqkwBNmpFceAYRsTPKwASBmR8hjb';
    var tumblr_paging_limit = 10;
    var $currentPage = 0;

    var tumblr = {
        load : function(offset, callbackFunc){
            var offset = (offset == undefined) ? 0 : offset;
            offset = parseInt(offset);
            var search = getUrlParameter('search');
            if(typeof search == 'undefined'){
                //do nothing
            }else{
                search = search.replace('%20', ' ');
                search = search.replace('-', ' ');
            }
// console.log(search);
            jQuery.ajax({
                'dataType': 'jsonp',
                'data': {'api_key' : tumblr_api_key,  jsonp : "loadDataCallback", 'limit':tumblr_paging_limit, 'offset':offset, 'tag':search },
                'url': tumblr_url,
                complete: function(data){
                    callbackFunc();
                }
            });
            $.ajax({
                url: "http://api.tumblr.com/v2/blog/gotoclassroom.tumblr.com/avatar/128?api_key=1nuqaEALkp3QUgNxrt0yeSoqkwBNmpFceAYRsTPKwASBmR8hjb",
                dataType: 'jsonp',
                success: function(avatar){
                    console.log(avatar.response.avatar_url)
                    $(".avatar").attr('src', avatar.response.avatar_url);
                }
            });
        }
    };


    /* Compile the markup as a named template */
    loadDataCallback = function(data, avatar)
    {
        //bind data to template
        // console.log(data.response);
        var numOfPost = data.response.posts.length;
        if(numOfPost == 0){
            jQuery('#loadmore').html('you reached end of internet');
        }

        jQuery( "#tumblrTemplate").tmpl( data.response.posts ).appendTo('#tumblr_posts');
        jQuery( "#recentpostsTemplate").tmpl( data.response.posts ).appendTo('#recent_posts');
        console.log(data.response.posts);

        $currentPage += tumblr_paging_limit;

        //enlarge the photo when click on its
        jQuery('#tumblr_posts').find('.image_thumbnail').bind('click', function(){
            obj = jQuery(this);
            rel = obj.attr('rel');

            if(rel > 0){
                obj.attr('src', obj.data('thumbnail'));
                obj.attr('rel', 0);
            }else{
                obj.attr('src', obj.data('full-size'));
                obj.attr('rel', 1);
            }
        });


        //open iframe video when click on the photo
        jQuery('#tumblr_posts').find('.retro_video_preview').bind('click', function(){
            var obj = jQuery(this);
            var id  = obj.data('id');
            var height  = obj.data('height');

            var embed = jQuery('#video_code_'+id).val();
            var player = jQuery('<div id="watch_video_'+id+'"></div>').addClass('video_embed embed-responsive embed-responsive-16by9').html(embed);
            player.find('iframe').addClass('embed-responsive-item').attr('width', '100%').attr('height', height);
            obj.parent().prepend(player);
            obj.hide();
        });

    }

    //loadmore click
    jQuery('#loadmore').bind('click', function() {
        tumblr.load($currentPage, function(){});
        classie.add( animEl, 'la-animate' );
    });

    //load data when scroll bottom
    var $isFetchingNotes = false;
    function bindScroll(){
        if (jQuery(window).scrollTop() + jQuery(window).height() >= jQuery('#loadmore').offset().top + jQuery('#loadmore').height() ) {
            if(!$isFetchingNotes) {
                $isFetchingNotes = true;

                //console.log($currentPage);

                //unbind scroll
                jQuery(window).unbind('scroll');

                //show loading
                classie.add( animEl, 'la-animate' );

                tumblr.load($currentPage, function(){
                    $isFetchingNotes = false;

                    //rebind scoll to bottom
                    jQuery(window).bind('scroll', bindScroll);

                    //hide loading
                    // setTimeout( function() {
                    //     classie.remove( animEl, 'la-animate' );
                    // }, 3000 );
                });
            }
        }
    }

    //first load
    tumblr.load(0, function(){
        jQuery('#loadmore').show();
        jQuery('#wpfooter').hide();
    });

    jQuery(window).load(function(){
        jQuery(window).scroll(bindScroll);
    });
});