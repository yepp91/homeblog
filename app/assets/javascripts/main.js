


$(function() { 
	$('.upp_block').click(function() {
		window.scrollTo(0, 0);
	});

	$(window).scroll(function() {
		if ($(window).scrollTop() > 200) {
			$('.upp_block').slideDown();
		} else
			$('.upp_block').slideUp();
	});	
});