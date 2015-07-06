/* headnav scroll size */
$(function() {
    $('#headnav').data('size', 'big');
    var $nav = $('#headnav'),
        $logo = $nav.find('h1 svg'),
        $width = $(window.width),
        $body = $('body'),
        $inactiveShows = $('.inactiveshows'),
        $memberModal = $('#membermodal'),
        $showModal = $('#showmodal'),
        $showInactiveMembers = $(".showInactiveMembers");

    $(window).scroll(function() {

        if ($body.scrollTop() < 40) {
            if ($nav.hasClass('stuck')) {
                console.log('unstick it');
                $nav.removeClass('stuck');
            }

        } else {
            if (!$nav.hasClass('stuck')) {
                console.log('stick it');
                $nav.addClass('stuck');
            }
        }
    });

    $nav.find("a").click(function(event) {
        event.preventDefault();
        $('html,body').animate({
            scrollTop: $(this.hash).offset().top - 90
        }, 1000);
    });

    /* button show load function */
    $("#morebutton").click(function(event) {
        event.preventDefault();
        var value = $(this).val();
        var $list = $inactiveShows;
        $('html,body').animate({
            scrollTop: $(this.hash).offset().top - 90
        }, 1000);
        $("#repertoar a:contains('" + value + "')").click();
    });

    $('.members a').click(function() {
        event.preventDefault();
        $memberModal.load(this.href);
        console.log("done");
        var old_content = $('#clenove');
        var pos = old_content.position();
        var new_content = $memberModal
            .width(old_content.width())
            .height(old_content.height())
            .css({
                top: pos.top,
                left: pos.left,
                'z-index': 999,
                position: 'absolute'
            });
        $memberModal.fadeIn();
        /* This needs more work to work in mobile and work properly */
        $('html,body').animate({
            scrollTop: $("#membermodal").offset().top + 150
        }, 1000);
    });

    $('.close').click(function() {
        event.preventDefault();
        $memberModal.fadeOut();
        $memberModal.empty();
    });

    /* Shows pop out */

    $('.shows li a').click(function() {
        $showModal.load(this.href);
        event.preventDefault();
        console.log("done");
        var old_content = $('#repertoar');
        var pos = old_content.position();
        var new_content = $showModal.width(old_content.width())
            .height(old_content.height())
            .css({
                top: pos.top,
                left: pos.left,
                'z-index': 999,
                position: 'absolute'
            });
        $showModal.fadeIn();
    });

    $showModal.on('click', '.closeme', function() {
        $showModal.fadeOut();
        $showModal.empty();
    });

    /* Inactive Members Roll-out + Shows roll-out */

    $showInactiveMembers.click(function(event) {
        event.preventDefault();
        $showInactiveMembers.find('span').empty();
        $(this).css("border", "none");
        $(this).find('i').show();
        $('.fadeOverlay').fadeOut();
        $('.inactiveSection').fadeOut();
        $('.inactiveSection').animateMe("height", 300);
        setTimeout(
            function() {
                $('.inactiveSection').css("overflow", "visible");
                $('.showInactiveMembers').fadeOut();
                $('.inactiveSection').fadeIn("slow");
            }, 500);
    });

    $(".showInactiveShows").click(function(event) {
        event.preventDefault();
        $('.showInactiveShows span').empty();
        $('.showInactiveShows').css("border", "none");
        $('.showInactiveShows i').show();
        $('.fadeout').fadeOut();
        $inactiveShows.fadeOut();
        $inactiveShows.animateMe("height", 300);
        setTimeout(function() {
            $inactiveShows.css("overflow", "visible");
            $('.showInactiveShows').fadeOut();
            $inactiveShows.fadeIn("slow");
        }, 500);
    });

    /* Mobile Menu stuff */
    $(".fa-bars").click(function() {
        $('#rmenu').fadeIn();
        $('.fa-bars').fadeOut();
    });


    $('#rclose').click(function() {
        $('#rmenu').fadeOut();
        $('.fa-bars').fadeIn();
    });
    
    $('#rmenu_in a').click(function() {
        $('html,body').animate({
            scrollTop: $(this.hash).offset().top - 90
        }, 1000);
        $('#rmenu').fadeOut();
        $('.fa-bars').fadeIn();
    });
});

/* Global animation function */
jQuery.fn.animateMe = function(prop, speed, callback) {
    var elem, height, width;
    return this.each(function(i, el) {
        el = jQuery(el), elem = el.clone().css({
            "height": "auto",
            "width": "auto"
        }).appendTo(el.parent());
        height = elem.css("height"),
            width = elem.css("width"),
            elem.remove();

        if (prop === "height")
            el.animate({
                "height": height
            }, speed, callback);
        else if (prop === "width")
            el.animate({
                "width": width
            }, speed, callback);
        else if (prop === "both")
            el.animate({
                "width": width,
                "height": height
            }, speed, callback);
    });
};