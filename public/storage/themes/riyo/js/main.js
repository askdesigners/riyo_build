/* headnav scroll size */
$(function(){
    $('#headnav').data('size','big');

    $(window).scroll(function(){
        var $nav = $('#headnav');
        var $logo = $('#headnav h1 svg');
        var $width = $(window.width);

        if ($('body').scrollTop() < 40) {

            if($nav.hasClass('stuck') + ($width < 960)){
                console.log('removing class');
                $nav.removeClass('stuck');
                $logo.css("max-height", "80px");
                $logo.css("margin-top", "12px");
            }

        } else {

            if(!$nav.hasClass('stuck') + ($width > 960)){
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
      /* button show load function */
    $("#morebutton").click(function(event){
        var value = $("#morebutton").val();
        var $list = $('.inactiveshows');
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top - 90}, 1000);
        $("#repertoar a:contains('" + value + "')").click();
    });
});

/* Modal window for Members! */

jQuery(function(){
    $('.members a').click(function(){
      $('#membermodal').load(this.href)
      console.log("done");
        var old_content=$('#clenove');
        var pos = old_content.position();
        var new_content=$('#membermodal').width(old_content.width())
                                                                .height(old_content.height())
            .css({top:pos.top,left:pos.left, 'z-index':999, position:'absolute'});
        $('#membermodal').fadeIn();
        event.preventDefault();
        $('html,body').animate({scrollTop:$("#membermodal").offset().top - -150}, 1000);
    })
    $('.close').click(function (e) {
        event.preventDefault();
          $('#membermodal').fadeOut();
          $('#membermodal').empty();
    });
});


/* Inactive Members Roll-out + Shows roll-out */

jQuery(function(){
  $(".showInactiveMembers").click(function(event){
      event.preventDefault();
      $('.showInactiveMembers span').empty();
      $('.showInactiveMembers').css("border","none");
      $('.showInactiveMembers i').show();
      $('.fadeOverlay').fadeOut();
      $('.inactiveSection').fadeOut();
      $('.inactiveSection').animateMe("height", 300);
      setTimeout(
        function()
        {
          $('.inactiveSection').css("overflow","visible");
          $('.showInactiveMembers').fadeOut();
          $('.inactiveSection').fadeIn("slow");
        }, 500);
  });
});

jQuery(function(){
  $(".showInactiveShows").click(function(event){
      event.preventDefault();
      $('.showInactiveShows span').empty();
      $('.showInactiveShows').css("border","none");
      $('.showInactiveShows i').show();
      $('.fadeout').fadeOut();
      $('.inactiveshows').fadeOut();
      $('.inactiveshows').animateMe("height", 300);
      setTimeout(
        function()
        {
      $('.inactiveshows').css("overflow","visible");
      $('.showInactiveShows').fadeOut();
      $('.inactiveshows').fadeIn("slow");
    }, 500);
  });
});

/* Shows pop out */

jQuery(function(){
    $('.shows li a').click(function(){
      $('#showmodal').load(this.href)
      console.log("done");
        var old_content=$('#repertoar');
        var pos = old_content.position();
        var new_content=$('#showmodal').width(old_content.width())
                                                                .height(old_content.height())
            .css({top:pos.top,left:pos.left, 'z-index':999, position:'absolute'});
        $('#showmodal').fadeIn();
        event.preventDefault();
    })

    $('#closeMe').click(function (e) {
        event.preventDefault();
          $('#showmodal').fadeOut();
          $('#showmodal').empty();
      });
});

/* Mobile Menu stuff */
$(".fa-bars").click(function(){
  $('#rmenu').fadeIn();
  $('.fa-bars').fadeOut();
});

jQuery(function(){
    $('#rclose').click(function(){
      $('#rmenu').fadeOut();
      $('.fa-bars').fadeIn();
    })
    $('#rmenu_in a').click(function(){
      $('html,body').animate({scrollTop:$(this.hash).offset().top - 90}, 1000);
      $('#rmenu').fadeOut();
      $('.fa-bars').fadeIn();
    })
});

/* Global animation function */

jQuery.fn.animateMe = function(prop, speed, callback){
    var elem, height, width;
    return this.each(function(i, el){
        el = jQuery(el), elem = el.clone().css({"height":"auto","width":"auto"}).appendTo(el.parent());
        height = elem.css("height"),
        width = elem.css("width"),
        elem.remove();

        if(prop === "height")
            el.animate({"height":height}, speed, callback);
        else if(prop === "width")
            el.animate({"width":width}, speed, callback);
        else if(prop === "both")
            el.animate({"width":width,"height":height}, speed, callback);
    });
}
