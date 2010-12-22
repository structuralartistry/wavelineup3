$(document).ready(function() {
  initialize_page();  	
});

function initialize_page() {
  ajax_links_and_forms();
  
  $('.hidden').hide();
  
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
	});

  $('h1').disableTextSelect();
  $('label').disableTextSelect();
	$('span').disableTextSelect();
  $('input[type=submit]').disableTextSelect();
  $('.selector_cell_nav').disableTextSelect();
	$('.selector_cell_submit').disableTextSelect();
  $('.selector_cell').disableTextSelect();
  $('.label').disableTextSelect();
  $('#notices').disableTextSelect();
  $('.wavelineup').disableTextSelect();

  $('.autosave').delayedObserver(function() {
      autosave(this.attr('id'), this.val());
  }, 0.5);

  // for touchscreens - highlight on mouse down
  $('.selector_cell, .selector_cell_nav').mousedown(function() {
    $(this).addClass("item_highlight");
  });
  // for web - highlight on mouse over
  $('.selector_cell, .selector_cell_nav, .selector_cell_submit').mouseover(function() {
    $(this).addClass("item_highlight");
    $(this).css("cursor", "pointer");
  });
  $('.selector_cell, .selector_cell_nav, .selector_cell_submit').mouseout(function() {
    $(this).removeClass("item_highlight");
  });

	$('.selector_cell_submit').mousedown(function() {
		$(this).addClass('L');
	});
}
