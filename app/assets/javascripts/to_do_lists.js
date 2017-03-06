$(document).ready(function(){
	$(".lst-btn").click(function(){
		$('#lst-index').hide();
		$('#lst-new').show();
		$('.page-ctas').hide();
		$(".to-do-form").show();
	});
	$(".cancel-btn").click(function(){
		$('#lst-index').show();
		$('#lst-new').hide();
		$('.page-ctas').show();
		$(".to-do-form").hide();
		$(".edittask").hide();
		$(".taskname").show();
		$(".element-btn").show();
	});
	// hide form unless the user click on the task, show form if click on other ".taskname"
	$(document).on('click', ".taskname", function(){
		$(".edittask").hide();
		$(".rgt_white-cntnr").hide();
		$(".element-btn").show();
		$(".smpl2-cntnr").hide();
		$(".class-helper").addClass("inline_divs");
		$('.element-btn').show();
		$(".taskname").show();
		$(this).closest(".taskname").hide();
		$(this).closest(".inline_divs").removeClass("inline_divs");
		$(this).parent().find('.edittask').show();
		$(this).parent().find('.task-name').focus();
	});
	$('.ttl-task').click(function(){
	  $('.form-task').show();
		$(this).hide();
		$('.form-task').focus();
	});
	$('.ingredient-btn').click(function(){
	  $(".smpl2-cntnr").hide();
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
	$(".element-btn").click(function(){
		$(this).hide();
		$('.simple-form-cntnr').show();
		$(".focus").focus();
	});
});

// Code for JQuery sortable
var ready, set_positions;

set_positions = function(){
	//look through and give each task a data-pos
	//attributes that hold this position in the DOM
	$(".class-helper.inline_divs").each(function(i){
		$(this).attr("data-pos", i+1);
	});
}

ready = function(){
	//call set_positions function for tasks
	set_positions();
	$( "#sortable" ).sortable({
    	axis: "y",
    	opacity: 0.8,
    	placeholder: "editsortable3"
	});

	//call set_positions function for to-do lists
	set_positions();
	$( "#sortable2" ).sortable({
		tolerance: "pointer",
		forcePlaceholderSize: true,
		placeholder: "editsortable",
		containment: "parent",
		cursor: "-webkit-grabbing",
    	opacity: 0.99
	});

	//after the order change sort to do lists
	$("#sortable2").sortable().bind('sortupdate', function(e, ui) {
		//array to store new order
		updated_order = []
		//set the updated positions
		set_positions();
		//populate the new updated_order with the new set_positions
		$(".to-do-cards.to-do-default").each(function(i){
			updated_order.push({ id: $(this).data("id"), position: i + 1 });
		});
		//send the updated order via ajax
		$.ajax({
			type: "PUT",
			url: '/to_do_lists/resort/:id',
			data: { order: updated_order }
		});
	});

	//after the order change sort tasks
	$("#sortable").sortable().bind('sortupdate', function(e, ui) {
		//array to store new order
		updated_order = []
		//set the updated positions
		set_positions();
		//populate the new updated_order with the new set_positions
		$(".class-helper.inline_divs").each(function(i){
			updated_order.push({ id: $(this).data("id"), position: i + 1 });
		});
		//send the updated order via ajax
		$.ajax({
			type: "PUT",
			url: '/to_do_lists/sort/:id',
			data: { order: updated_order }
		});
	});
}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);
//END of code for JQuery sortable
