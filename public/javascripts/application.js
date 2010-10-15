$(document).ready(function() {
  
  initialize_page();
  
});


function initialize_page() {
  ajax_links_and_forms();
  
  $('.hidden').hide();
  
  // $('a').button();
  // $('a').removeClass('ui-corner-all') // take off the rounded corners


  $('.autosave').delayedObserver(function() {
      autosave(this.attr('id'), this.val());
  }, 0.5);

  // for touchscreens - highlight on mouse down
  $('.selector_cell, .selector_cell_add, .selector_cell_edit, .selector_cell_delete, .selector_cell_save, .selector_cell_cancel, .selector_cell_nav').mousedown(function() {
    $(this).addClass("item_highlight");
  });
  // for web - highlight on mouse over
  $('.selector_cell, .selector_cell_add, .selector_cell_edit, .selector_cell_delete, .selector_cell_save, .selector_cell_cancel, .selector_cell_nav').mouseover(function() {
    $(this).addClass("item_highlight");
    $(this).css("cursor", "pointer");
  });
  $('.selector_cell, .selector_cell_add, .selector_cell_edit, .selector_cell_delete, .selector_cell_save, .selector_cell_cancel, .selector_cell_nav').mouseout(function() {
    $(this).removeClass("item_highlight");
  });
}
