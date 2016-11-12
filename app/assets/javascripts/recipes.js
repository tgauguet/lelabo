
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

// hide and show portions weights in select unit forms
$(document).ready(function(){
    $('.trigger').click(function() {
        $('.content').hide();
        $('.' + $(this).data('rel')).show();
    });
});

// hide and show form informations in select quantities forms
$(document).ready(function(){
    $('.trigger2').click(function() {
        $('.content2').hide();
        $('.' + $(this).data('rel')).show();
    });
});

$(document).ready(function(){
  $(".meas-env").click(function(){
    $(".meas-env").addClass("div-active");
    $(".select-measure").show();
		$(".recipe-values, .print-measure").hide();
		$(".show-pdf").removeClass("div-active");
    $('.prod-quantities').addClass("prod-tip2");
    $('.prod-quantities').removeClass("prod-tip1 prod-tip3");
  });
  $(".hide-meas").click(function(){
    $(".print-measure, .select-measure").hide();
		$(".recipe-values").show();
    $(".meas-env").removeClass("div-active");
		$(".show-pdf").removeClass("div-active");
    $('.prod-quantities').removeClass("prod-tip2 prod-tip3");
    $('.prod-quantities').addClass("prod-tip1");
  });
	$(".show-pdf").click(function(){
    $(".select-measure, .recipe-values").hide();
    $(".print-measure").show();
		$(".meas-env").removeClass("div-active");
    $('.prod-quantities').removeClass("prod-tip2");
    $('.prod-quantities').addClass("prod-tip3 prod-tip1");
  });
});
