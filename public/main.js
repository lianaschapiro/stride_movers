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
		$(".dropdown-content").delay(3000).slideUp('slow');
	})
	$(".dropdown").mouseleave(function(){
		$(".dropdown-content").slideUp('slow');
	})
	// $(".dropbtn").click(function(){
	//     $(".dropdown-content").delay(4000).slideUp('slow');
	// })
	$(".dropdown-content").click(function(){
	    $(".dropdown-content").slideUp('slow');
	})
// });
