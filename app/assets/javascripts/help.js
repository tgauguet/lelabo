// hide and show each form in edit view
$(document).ready(function(){
  $('.help-cat ul li').click(function(){
    $(".help-option").hide();
    $("#div"+$(this).attr('target')).show();
  });
});
