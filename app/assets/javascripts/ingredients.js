
//submit alert message if the user select unity and don't display the unit weight
$(function(){
	$("#submit-ing").click(function(event){
		event.preventDefault();
		var unit = document.forms["fform"]["ingredient[unit]"].value;
		var unit_weight = document.forms["fform"]["ingredient[unit_weight]"].value;
		if ((unit == "Unité") && (unit_weight == "")) {
			alert("Merci d'entrer le Poids par unité");
		} else {
			$(".edit_ingredient").submit();
		}
	})
});

var ready, set_positions;

set_positions = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('.price-info').each(function(i){
        $(this).attr("data-pos",i+1);
    });
}

ready = function(){

    // call set_positions function
    set_positions();

    $('.sortable').sortable();

    // after the order changes
    $('.sortable').sortable().bind('sortupdate', function(e, ui) {
        // array to store new order
        updated_order = []
        // set the updated positions
        set_positions();

        // populate the updated_order array with the new task positions
        $('.price-info').each(function(i){
            updated_order.push({ id: $(this).data("id"), position: i+1 });
        });

        // send the updated order via ajax
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
