$(document).ready(function(){
	$(".delete-pop-over").click(function(){
		$(".confirm-cntnr").show();
	});
	$(".confirm-false").click(function(){
		$(".confirm-cntnr").hide();
	});
	$(".confirm-true").click(function(){
		$(".confirm-cntnr").hide();
	});
	$(".confirm-cntnr").click(function(){
		$(".confirm-cntnr").hide();
	});
});

// hide and show each form in edit view
$(document).ready(function(){
  $('.recipe-btn').click(function(){
    $(".recipe-option").hide();
    $("#div"+$(this).attr('target')).show();
  });
});
