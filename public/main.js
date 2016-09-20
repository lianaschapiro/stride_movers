$(document).ready(function(){

	// Background slideshow on landing page
	$("#big_image_background").backstretch([
    	"images/couple1.jpg",
    	"images/couple2.jpg",
    	// "images/couple3.jpg",
    	"images/couple4.jpg",
      "images/couple5.jpg",
      "images/couple6.jpg",
      "images/couple7.jpg",
      "images/couple8.jpg"
  	], {duration: 3000, fade: 2000, centeredY: false});

	//Background slideshow on "services" page
	// $("#services").backstretch([
 //    	"images/couple5.jpg",
 //    	"images/couple6.jpg",
 //    	"images/couple7.jpg",
 //    	"images/couple8.jpg"
 //  	], {duration: 3000, fade: 2000, centeredY: false});

	//Background slideshow on "moving tips" page
	// $("#movingtips_header").backstretch([
 //    	"images/1.jpg",
 //      "images/2.jpg",
 //      "images/3.jpg",
 //      "images/4.jpg",
 //      "images/5.jpg",
 //    	"images/6.jpg",
 //    	"images/7.jpg",
 //    	"images/8.jpg"
 //  	], {duration: 3000, fade: 2000, centeredY: false});

  	//Background slideshow on "testimonials" page
	// $("#testimonials_header").backstretch([
 //    	"images/1.jpg",
 //    	"images/2.jpg",
 //    	"images/3.jpg",
 //    	"images/4.jpg"
 //  	], {duration: 3000, fade: 2000, centeredY: false});

	// Dropdown menus on the nav bar
	$("#dropdown_one").mouseenter(function(){
		$("#dropdown-content_one").slideDown('slow');
		$("#dropdown-content_one").delay(2500).slideUp('slow');
	})
	$("#dropdown_one").mouseleave(function(){
		$("#dropdown-content_one").slideUp('slow');
	})
	$("#dropdown-content_one").click(function(){
	    $("#dropdown-content_one").slideUp('slow');
	})

	$("#dropdown_two").mouseenter(function(){
		$("#dropdown-content_two").slideDown('slow');
		$("#dropdown-content_two").delay(1500).slideUp('slow');
	})
	$("#dropdown_two").mouseleave(function(){
		$("#dropdown-content_two").slideUp('slow');
	})
	$("#dropdown-content_two").click(function(){
	    $("#dropdown-content_two").slideUp('slow');
	})

	// Fades out flash messages after 1 second
	$(".flash").delay(1000).fadeOut(1000);


	// Open and close the general rates modal
	// function openRatesModal() {
	//   $('#rates_outer_modal').fadeIn(200);
	// }
	// function closeRatesModal() {
	//   $('#rates_outer_modal').fadeOut(200);
	// }

});
