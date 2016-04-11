

function openRatesModal() {
  $('#rates_outer_modal').fadeIn(200);
}


function closeRatesModal() {
  $('#rates_outer_modal').fadeOut(200);
}

$(document).ready(function(){
	$(".dropdown-content").click(function(){
	    $(".dropdown-content").slideUp('slow');
	})
});
