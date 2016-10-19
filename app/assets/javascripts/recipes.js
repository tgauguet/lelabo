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
		$(".recipe-btn").removeClass("current-form");
		$(this).addClass("current-form");
    $("#div"+$(this).attr('target')).show();
  });
});

$(document).ready(function(){
  $(".delete-pop-over").click(function(){
      $(this).hide();
      $(this).parent().find(".show-delete").show();
  });
  $(".remv-delete").click(function(){
      $(this).hide();
      $(this).parent().find(".show-delete").hide();
      $(this).parent().find(".delete-pop-over").show();
  });
});
