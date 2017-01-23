
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

// hide and show each cells
$(document).ready(function() {
  $('.tab').click(function() {
    $('.q-f1, .q-f2, .tab').toggle();
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
  $(".pop-on").click(function(){
    $(".select-measure").toggle();
  });
  $(".hide-meas").click(function(){
    $(".print-measure, .select-measure").hide();
		$(".recipe-values").show();
		$(".show-pdf").removeClass("div-active");
    $('.prod-quantities').removeClass("prod-tip2 prod-tip3");
    $('.prod-quantities').addClass("prod-tip1");
  });
});
