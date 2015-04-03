/* headnav scroll size */
$(function(){
    $('#headnav').data('size','big');

    $(window).scroll(function(){
        var $nav = $('#headnav');
        var $logo = $('#headnav h1 svg');

        if ($('body').scrollTop() < 40) {

            if($nav.hasClass('stuck')){
                console.log('removing class');
                $nav.removeClass('stuck');
                $logo.css("max-height", "80px");
                $logo.css("margin-top", "12px");
            }

        } else {

            if(!$nav.hasClass('stuck')){
                console.log('adding class');
                $nav.addClass('stuck');
                $logo.css("max-height", "35px");
                $logo.css("margin-top", "2px");
            }
        }
    });

    $("#headnav a").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top - 90}, 1000);
    });

});


$('.memberName').click(function(){
      $('#membermodal').load(this.href)
      console.log("done");
      return false;
})
