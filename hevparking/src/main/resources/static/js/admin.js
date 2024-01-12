$(function() {

	$(document).ready(function() {

		var overlay_navigation = $('.overlay-navigation'),
			nav_item_1 = $('nav li:nth-of-type(1)'),
			nav_item_2 = $('nav li:nth-of-type(2)'),
			nav_item_3 = $('nav li:nth-of-type(3)'),
			nav_item_4 = $('nav li:nth-of-type(4)'),
			nav_item_5 = $('nav li:nth-of-type(5)');
			nav_item_6 = $('nav li:nth-of-type(6)');

		overlay_navigation.toggleClass('overlay-active');
		if (overlay_navigation.hasClass('overlay-active')) {

			overlay_navigation.removeClass('overlay-slide-up').addClass('overlay-slide-down')
			nav_item_1.removeClass('slide-in-nav-item-reverse').addClass('slide-in-nav-item');
			nav_item_2.removeClass('slide-in-nav-item-delay-1-reverse').addClass('slide-in-nav-item-delay-1');
			nav_item_3.removeClass('slide-in-nav-item-delay-2-reverse').addClass('slide-in-nav-item-delay-2');
			nav_item_4.removeClass('slide-in-nav-item-delay-3-reverse').addClass('slide-in-nav-item-delay-3');
			nav_item_5.removeClass('slide-in-nav-item-delay-4-reverse').addClass('slide-in-nav-item-delay-4');
			nav_item_6.removeClass('slide-in-nav-item-delay-5-reverse').addClass('slide-in-nav-item-delay-5');
		} else {
			overlay_navigation.removeClass('overlay-slide-down').addClass('overlay-slide-up')
			nav_item_1.removeClass('slide-in-nav-item').addClass('slide-in-nav-item-reverse');
			nav_item_2.removeClass('slide-in-nav-item-delay-1').addClass('slide-in-nav-item-delay-1-reverse');
			nav_item_3.removeClass('slide-in-nav-item-delay-2').addClass('slide-in-nav-item-delay-2-reverse');
			nav_item_4.removeClass('slide-in-nav-item-delay-3').addClass('slide-in-nav-item-delay-3-reverse');
			nav_item_5.removeClass('slide-in-nav-item-delay-4').addClass('slide-in-nav-item-delay-4-reverse');
			nav_item_6.removeClass('slide-in-nav-item-delay-5').addClass('slide-in-nav-item-delay-5-reverse');
		}

	});
});