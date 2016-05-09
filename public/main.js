$(document).ready(function(){

	// Background slideshow on landing page
	setInterval(function() {
		var random_num = Math.floor((Math.random() * 6) + 1);
 		$('#big_image_background').css({"background-image" : "url('images/couple" + random_num + ".jpg')"});
	}, 4000);

	// Open and close the general rates modal
	function openRatesModal() {
	  $('#rates_outer_modal').fadeIn(200);
	}
	function closeRatesModal() {
	  $('#rates_outer_modal').fadeOut(200);
	}

	// Dropdown menus on the nav bar
	$(".dropdown").mouseenter(function(){
		$(".dropdown-content").slideDown('slow');
		$(".dropdown-content").delay(2000).slideUp('slow');
	})
	$(".dropdown").mouseleave(function(){
		$(".dropdown-content").slideUp('slow');
	})
	$(".dropdown-content").click(function(){
	    $(".dropdown-content").slideUp('slow');
	})

	$(".flash").delay(1000).fadeOut(1000);

});
