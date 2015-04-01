/* headnav scroll size */
$(function(){
    $('#headnav').data('size','big');

    $(window).scroll(function(){
        var $nav = $('#headnav');
        if ($('body').scrollTop() < 40) {

            if($nav.hasClass('stuck')){
                console.log('removing class');
                $nav.removeClass('stuck');
            }

        } else {

            if(!$nav.hasClass('stuck')){
                console.log('adding class');
                $nav.addClass('stuck');
            }
        }
    });

    $("#headnav a").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top - 90}, 1000);
    });

});