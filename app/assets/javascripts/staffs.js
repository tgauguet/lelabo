$(document).ready(function(){
  $('.staff-btn').click(function(){
    $('.staff-form').show();
    $(this).hide();
  });
  $(".cancel-btn").click(function(){
    $('.staff-btn').show();
    $('.staff-form').hide();
  });
});
