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

// disable and clear form weight if QS value is selected
$(document).ready(function(){
  $('*[id^="recipe"]').on('change', function(){
    var  others = $(this).val();
    if(others == "QS"){
      $(this).parent().parent().find('input').attr('disabled','disabled');
      $(this).parent().parent().find('input').val("");
      }else{
      $(this).parent().parent().find('input').removeAttr('disabled');
    }
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

// hide and show forms in select unit popover
$(document).ready(function(){
    $('.trigger').click(function() {
        $('.content').hide();
        $('.' + $(this).data('rel')).show();
    });
});

$(document).ready(function(){
	// hide and show form informations in select quantities forms
  $('.trigger2').click(function() {
      $('.content2').hide();
      $('.' + $(this).data('rel')).show();
  });
	// toggle pop overs
  $(".pop-on").click(function(){
    $(".select-measure").toggle();
  });
	$(".pop-2").click(function(){
    $(".send-email").toggle();
  });
	// basic grestion of quantities form
  $(".hide-meas").click(function(){
    $(".print-measure, .select-measure").hide();
    $('.prod-quantities').addClass("prod-tip1");
  });
});
