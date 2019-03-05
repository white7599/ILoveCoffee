
$(function(){
	$('.slideshow').each(function(){
		var $slides = $(this).find('img'),
			slideCount =$slides.length,
			currentIndex = 0;

			$slides.eq(currentIndex).fadeIn();
			setInterval(showNextSlide,3000);

			function showNextSlide(){
				var nextIndex = (currentIndex + 1) %slideCount;
				$slides.eq(currentIndex).fadeOut();

				$slides.eq(nextIndex).fadeIn();

				currentIndex = nextIndex;
			}
	});
});
