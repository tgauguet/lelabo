
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
})
