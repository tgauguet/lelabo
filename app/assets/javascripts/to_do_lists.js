$(document).ready(function(){
	$(".element-btn").click(function(){
		$(".explaination-cntnr").hide();
		$(".element-btn").hide();
		$(".simple-form-cntnr").show();
	});
	$(".cancel-btn").click(function(){
		$(".simple-form-cntnr").hide();
		$(".explaination-cntnr").show();
		$(".element-btn").show();
	});
	$(".cancel-btn").click(function(){
		$(".edittask").hide();
		$(".taskname").show();
	});
	// hide form unless the user click on the task, show form if click on other ".taskname"
	$(document).on('click', ".taskname", function(){
		$(".edittask").hide();
		$(".simple-form-cntnr").hide();
		$(".element-btn").show();
		$(".class-helper").addClass("inline_divs");
		$(".taskname").show();
		$(this).closest(".taskname").hide();
		$(this).closest(".inline_divs").removeClass("inline_divs");
		$(this).parent().find('.edittask').show();
		$(this).parent().find('.task-name').focus();
	});

	// hide div on link click, action: delete
	$(document).on("click", "#delete-task", function(){
		$(this).parent().hide();
	});
});
$.datepicker.setDefaults( $.datepicker.regional[ "fr" ] );
$(document).ready(function($) {
  $(".datepicker").each(function() {
     $(this).datepicker({
       	autoclose: true, 
       	dateFormat: "dd-mm-yy",
       	closeText: 'Fermer',
		prevText: 'Précédent',
		nextText: 'Suivant',
		currentText: 'Aujourd\'hui',
		monthNames: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
		monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Août', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
		dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
		dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
		dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
		weekHeader: 'Sem.',
		dateFormat: 'dd-M-yy'
     });
  });
});