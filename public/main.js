// $(document).ready(function(){

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
// });
