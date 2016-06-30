var ready, set_positions;

set_positions = function(){
	//look through and give each task a data-pos
	//attributes that hold this position in the DOM
	$(".class-helper.inline_divs").each(function(i){
		$(this).attr("data-pos", i+1);
	});
}

ready = function(){
	//call set_positions function
	set_positions();
	$( "#sortable1" ).sortable({
    	axis: "y", 
    	tolerance: "pointer",
		forcePlaceholderSize: true,
		placeholder: "editsortable2",
		containment: "parent",
		cursor: "-webkit-grabbing",
    	opacity: 0.99
	});

	//after the order change
	$("#sortable1").sortable().bind('sortupdate', function(e, ui) {
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
			url: '/ingredients/sort/:id',
			data: { order: updated_order }
		});
	});
}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);
$(document).on('page:change', ready);

$(document).ready(function(){
  $(".inside-btn").click(function(){
    $(".explaination-cntnr").hide();
    $(".simple-form-cntnr").show();
  });
  $(".cancel-btn").click(function(){
    $(".simple-form-cntnr").hide();
    $(".explaination-cntnr").show();
  });
  $(".cancel-btn").click(function(){
    $(".simple-form-cntnr").hide();
    $(".explaination-cntnr").show();
    $(".hide-btn").show();
  });
});