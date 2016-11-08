// hide and show each form in help views
$(document).ready(function(){
  $('.help-tips ul li').click(function(){
		$(this).toggleClass("current-question");
    $(this).nextAll('div').first().slideToggle();
  });
});
