$(document).ready(function() {
  $('a').button();
  $('a').removeClass('ui-corner-all') // take off the rounded corners
  
  $('.selector_cell, .selector_cell_add, .selector_cell_delete, .selector_cell_save, .selector_cell_cancel, .selector_cell_nav').mousedown(function() {
    $(this).addClass("item_hover");
    $(this).css("cursor", "pointer");
  });
  $('.selector_cell, .selector_cell_add, .selector_cell_delete, .selector_cell_save, .selector_cell_cancel, .selector_cell_nav').mouseout(function() {
    $(this).removeClass("item_hover");
  });  
});
