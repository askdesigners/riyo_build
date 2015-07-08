/* headnav scroll size */
function UI(){
    var self = this;
    $(function() {
        self.init();
    });
}

UI.prototype = {

    constructor: UI,

    init: function(){

        this.$nav = $('#headnav'),
        this.$logo = this.$nav.find('h1 svg'),
        this.$body = $('body'),
        this.$inactiveShows = $('.inactiveshows'),
        this.$memberModal = $('#membermodal'),
        this.$modal = $('#modal'),
        this.$showInactiveMembers = $(".showInactiveMembers"),
        this.$showInactiveShows = $(".showInactiveShows"),
        this.$morebutton = $("#morebutton"),
        this.$rmenu = $('#rmenu'),
        this.$fabars = $(".fa-bars");

        var isMobile = function() {
            var check = false;
            (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
            return check;
        }

        this.bindEvents(isMobile);
        this.initPulse();
    },

    bindEvents: function(isMobile){
        var self = this;
        $(window).scroll(function(){
            self.updateStuck.call(self);
        });

        this.$nav.find("a").click(function(event) {
            event.preventDefault();
            self.$body.animate({
                scrollTop: $(this.hash).offset().top - 90
            }, 1000);
        });

        this.$morebutton.click(function(event) {
            self.showEventDetails(self, this.hash, event);
        });

        this.$showInactiveMembers.click(function(event){

            self.revealMore(this, event);

        });

        this.$showInactiveShows.click(function(event){

            self.revealMore(this, event);

        });

        /* Mobile Menu stuff */
        self.$fabars.click(function() {
            self.$rmenu.fadeIn();
            $(this).fadeOut();
        });

        $('#rclose').click(function() {
            self.$rmenu.fadeOut();
            self.$fabars.fadeIn();
        });
        
        $('#rmenu_in a').click(function() {
            $('html,body').animate({
                scrollTop: $(this.hash).offset().top - 90
            }, 1000);
            self.$rmenu.fadeOut();
            self.$fabars.fadeIn();
        });

    },

    showEventDetails: function(self, hash, event){
        event.preventDefault();
        var value = $(self.$morebutton).val();
        var $list = self.$inactiveShows;
        $('html,body').animate({
            scrollTop: $(hash).offset().top - 90
        }, 1000);
        $("#repertoar a:contains('" + value + "')").click();
    },

    showContentModal: function(){},

    updateStuck: function(){
        if (this.$body.scrollTop() < 40) {
            if (this.$nav.hasClass('stuck')) {
                this.$nav.removeClass('stuck');
            }
        } else {
            if (!this.$nav.hasClass('stuck')) {
                this.$nav.addClass('stuck');
            }
        }
    },

    revealMore: function(element, event){
        event.preventDefault();
        
        var $element = $(element),
            $section = $element.closest('section').find('.inactiveSection');
            $fadeOverlay = $element.closest('section').find('.fadeOverlay');
        
        $element.find('span').empty();
        $element.css("border", "none");
        $element.find('i').show();
        $section.animateMe('height', 'auto');
        
        setTimeout(function() {
            $fadeOverlay.animateMe('height', '0');
            $element.fadeOut();
        }, 500);
    },

    initPulse: function(){
        var $spinner = $('#ss_spinner');
        pulse.on( 'start', function() {
            $spinner.addClass('loading');
        });

        pulse.on( 'waiting', function(e) {
            if (e) {
                $spinner.addClass('loading');
            } else {
                $spinner.removeClass('loading');
            }
        });

        pulse.on( 'dataloaded', function() {
            $spinner.removeClass('loading');
        });

        pulse.on( 'transitionstart', function(e) {
            var data = e.data;

            $('#home-slideshow-text').show();
            $('#home-slideshow-title').html(data.title || data.filename);
            $('#description').html(data.caption);
            $('#home-slideshow-title-link').attr("href", data.url);
            $('#morebutton').attr("value", data.title);
        });

    }

};

new UI();

$(function() {
    $('#headnav').data('size', 'big');
    var $nav = $('#headnav'),
        $logo = $nav.find('h1 svg'),
        $body = $('body'),
        $inactiveShows = $('.inactiveshows'),
        $memberModal = $('#membermodal'),
        $showModal = $('#showmodal'),
        $showInactiveMembers = $(".showInactiveMembers");

    /* button show load function */


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