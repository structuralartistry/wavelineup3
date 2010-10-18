$(document).ready(function() {
  
  initialize_page();
  
});


function initialize_page() {
  ajax_links_and_forms();
  
  $('.hidden').hide();
  
  // $('a').button();
  // $('a').removeClass('ui-corner-all') // take off the rounded corners

  // noSelect - all objects which should not be selectable
  // these must go before the disableTestSelect function addition below
  $("h1").addClass("noSelect");
  $("label").addClass("noSelect");
  $("input[type=submit]").addClass("noSelect");
  $(".selector_cell_nav").addClass("noSelect");
  $(".selector_cell").addClass("noSelect");
  $(".label").addClass("noSelect");
  $("#notices").addClass("noSelect");
  $(".wavelineup").addClass("noSelect");

  // no select - this makes the text of any element with this class not selectable
  $(function(){
  	$.extend($.fn.disableTextSelect = function() {
  		return this.each(function(){
  			if($.browser.mozilla){//Firefox
  				$(this).css('MozUserSelect','none');
  			}else if($.browser.msie){//IE
  				$(this).bind('selectstart',function(){return false;});
  			}else{//Opera, etc.
  				$(this).mousedown(function(){return false;});
  			}
  		});
  	});
  	$('.noSelect').disableTextSelect();//No text selection on elements with a class of 'noSelect'
  });

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
