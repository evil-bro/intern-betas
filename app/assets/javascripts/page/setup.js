var myElement = document.querySelector("header");
var headroom  = new Headroom(myElement);
headroom.init(); 

$(document).ready(function() {
	$('.learn-more').on('click', function() {
		$(this).parent().parent().parent().find('.vacancy-learn-more').toggle();
	});
})