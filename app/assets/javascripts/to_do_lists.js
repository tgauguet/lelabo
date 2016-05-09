$(document).ready(function(){
	$(".inside-btn").click(function(){
		$(".explaination-cntnr").hide();
		$(".hide-btn").hide();
		$(".simple-form-cntnr").show();
	});
	$(".cancel-btn").click(function(){
		$(".simple-form-cntnr").hide();
		$(".explaination-cntnr").show();
		$(".hide-btn").show();
	});

	// hide form unless the user click on the task, show form if click on other ".taskname"
	$(document).on('click', ".taskname", function(){
		$(".edittask").hide();
		$(".taskname").show();
		$(this).closest(".taskname").hide();
		$(this).parent().find('.edittask').show();
		$(this).parent().find('.task-name').focus();
	});

	// hide div on link click, action: delete
	$(document).on("click", "#delete-task", function(){
		$(this).parent().hide();
	});
});

