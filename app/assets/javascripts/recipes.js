
$(document).ready(function(){

	// **************** NEW & EDIT ACTION ******************
		// show & hide create ingredient popover
	  	$(".pop-over-new").click(function(){
	    	$(".popover-new").show();
	    	$(".actions-cntnr").addClass("no-scroll");
	  	});
	  	$(".pop-off").click(function(){
	    	$(".select-measure").hide();
	    	$(".actions-cntnr").removeClass("no-scroll");
	  	});
		//disable and clear form weight if QS value is selected
			$('*[id^="recipe"]').on('change', function(){
		    var  others = $(this).val();
		    if(others == "QS"){
		      $(this).parent().parent().find('input').attr('disabled','disabled');
		      $(this).parent().parent().find('input').val("");
		      }else{
		      $(this).parent().parent().find('input').removeAttr('disabled');
		    }
		  });

	// **************** NEW, EQUILIBRIUM & EDIT ACTION ******************
		// Use select2 to search ingredients faster
			$('[id*="ingredient_id"]').select2();
			$('[id*="sub_id"]').select2();

	// **************** ALL EXCEPT NEW ACTION ******************
		// Hide and show loading animation for each page changement inside recipes form
			$(".recipe-btn").click(function(){
				$(".rec-cntnr").hide();
				$(".load-url").show();
			});

	// **************** SHOW ACTION ******************
		// Hide and show loading animation for each page changement inside recipes form
			$(".email-sender").click(function(){
				$(".email-pop").toggle();
			});

	// **************** QUANT & COST ACTION ******************
		// Hide and show select measure popover
			$(".pop-on").click(function(){
		  	$(".pop-qt").show();
		  	$(".actions-cntnr").addClass("no-scroll");
			});
			$(".pop-off").click(function(){
	    	$(".select-measure").hide();
	    	$(".actions-cntnr").removeClass("no-scroll");
	  	});
		// hide and show forms in select unit popover
		  $('.trigger').click(function() {
		    $('.content').hide();
		    $('.' + $(this).data('rel')).show();
		  });
		// Hide and show form informations in select quantities forms
		  $('.trigger2').click(function() {
		      $('.content2').hide();
		      $('.' + $(this).data('rel')).show();
		  });
		// hide and show each cells
			$('.tab').click(function() {
		    $('.q-f1, .q-f2, .tab').toggle();
		  });
		// hide and show each cells
		   $('.tab').click(function() {
		     $('.c-f1, .c-f2, .tab').toggle();
		   });

	// **************** INDEX ACTION ******************
		// Used as button to destroy the recipes
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
