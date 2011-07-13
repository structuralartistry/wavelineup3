$(document).ready(function() {
  initialize_page();
});

function initialize_page() {
	$('.hidden').hide();

  ajax_links_and_forms();

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
	$('th').disableTextSelect();
	$('p').disableTextSelect();
	$('li').disableTextSelect();
  $('input[type=submit]').disableTextSelect();
  $('.selector_cell_nav').disableTextSelect();
	$('.selector_cell_submit').disableTextSelect();
  $('.selector_cell').disableTextSelect();
	$('.mini_travel_card_cell').disableTextSelect();
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
		$(this).addClass('current_selected');
	});
}


// left column methods
var practice_member_selector_available;
var new_practice_member_form_available;
var lineup_selector_available;

function set_left_column_buttons() {
  if(new_practice_member_form_available) {
    $('#new_practice_member_show_selector_cell').show();
  }
  if(practice_member_selector_available) {
    $('#practice_member_selector_show_selector_cell').show();
  }
  if(lineup_selector_available) {
    $('#lineup_selector_show_selector_cell').show();
  }

	selectors = new Array('#new_practice_member', '#practice_member_selector', '#feedback_support', '#lineup_selector');
	for (key in selectors) {
		value = selectors[key]
		if($(value).is(':visible')) {
	    $(value + '_show_selector_cell').addClass('current_selected');
	  }
	  else {
	    $(value + '_show_selector_cell').removeClass('current_selected');
	  }
	}
}

function show_dialog(dialog_id) {
  // if form already showing dont need to load, just need to toggle off
  if( !$('#' + dialog_id + '_show_selector_cell').hasClass('current_selected') ) {

		switch(dialog_id) {
			case 'new_practice_member':
        $('#' + dialog_id).html(new_practice_member_form());
        break;
			case 'feedback_support': $('#' + dialog_id).html(feedback_support_form()); break;
		}
		initialize_page();
		toggle_dialog(dialog_id);
		set_left_column_buttons();
  }
  else {
    toggle_dialog(dialog_id);
  }
$('#practice_member_first_name').focus();
}

function toggle_dialog(dialog_id) {
	// determine if need is to show or hide before we close all selectors
  if($('#' + dialog_id).is(':visible')==true) is_showing_now = true;
  else is_showing_now = false;

  $('.selector').hide();
  if(is_showing_now) $('#' + dialog_id).hide();
  else $('#' + dialog_id).show('slide');
  set_left_column_buttons();
}

selected_practice_member_id = '';

// practice member selector
function navigate_now() {
  selected_page_name = $('.page_selector.current_selected').html();
  switch(selected_page_name) {
    case 'Personal Info':
      nav_url = '/practice_members/' + selected_practice_member_id + '/edit';
      break;
    case 'Practice Room':
      nav_url = '/practice_room/' + selected_practice_member_id + '/visit';
      break;
  }
  window.location.href=nav_url
}
