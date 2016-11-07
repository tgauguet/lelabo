// hide and show each form in edit view
$(document).ready(function(){
  $('.help-cat ul li').click(function(){
    $(".help-option").hide();
    $(".help-cat ul li").removeClass("current-help");
		$(this).addClass("current-help");
    $("#div"+$(this).attr('target')).show();
  });
});
