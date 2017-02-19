// show and hide the search by category window
$(document).click(function(e){
  if (e.target.class != ".show-sort" && !$('.show-sort').find(e.target).length){
    if (e.target.class != ".sort-paths" && !$('.sort-paths').find(e.target).length){
      $(".sort-paths").hide();
    }
  }
});
$(document).ready(function(){
  $('.show-sort').click(function(){
    $('.sort-paths').toggle();
  });
});
