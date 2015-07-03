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
      /* button show load function */
    $("#morebutton").click(function(event){
        var value = $("#morebutton").val();
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
      $('.fadeOverlay').fadeOut();
      $('.inactiveSection').animate({height:'420px'}, 500);
      $('.inactiveSection').css("overflow","visible");
      $('.showInactiveMembers').fadeOut();
  });
});

jQuery(function(){
  $(".showInactiveShows").click(function(event){
      event.preventDefault();
      $('.fadeout').fadeOut();
      $('.inactiveshows').animate({height:'100%'}, 500);
      $('.inactiveshows').css("overflow","visible");
      $('.showInactiveShows').fadeOut();
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
});
