function show_selector(selector_name, calling_object, element_to_update_inner_html_on_set, control_to_update_on_set) {
  element_to_update_inner_html=element_to_update_inner_html_on_set;
  control_to_update=control_to_update_on_set;
  
  switch(selector_name) {
    case "boolean_selector":
      boolean_toggle_selected_value(calling_object);
      break;
    case "side_selector":
      left_right_toggle_selected_value(calling_object);
      break;
    default:
      if(selector_name=="phase_gateway_selector") {
        // set gateway choices based on the selected phase and whether this is gateway_1, 2 or affecting gateway
        set_phase_and_gateway_currently_working();
                        
        selected_phase = $('#practice_member_visit_phase_' + visit_phase_currently_working).val();
          
        set_phase_gateway_selector_choices(selected_phase);
      }
      else if(selector_name=="phase_direction_selector") {
        set_phase_and_gateway_currently_working();
        
        selected_phase = $('#practice_member_visit_phase_' + visit_phase_currently_working).val();
        
        set_phase_direction_selector_choices(visit_phase_currently_working, selected_phase);
      }
      else if(selector_name.indexOf("phase")>=0) {
        set_phase_and_gateway_currently_working();
      }

        
        
      eleOffset = $(calling_object).offset();
      left = eleOffset.left + 'px';
      top = eleOffset.top + 'px';
      $(".selector").hide();
      $('#' + selector_name).css("left",left).css("top",top).css("position","absolute");
      $('#' + selector_name).show();
      break;
  }
}

function boolean_toggle_selected_value(object) {
  current_value = $(object).html();
  if(current_value=="X") $(object).html("");
  else $(object).html("X");
  
  set_selected_value(object);
}

function left_right_toggle_selected_value(object) {
  current_value = $(object).html();
  if(current_value=="") $(object).html("L");
  else if(current_value=="L") $(object).html("R");
  else $(object).html("");
  
  set_selected_value(object);
}

function set_selected_value(object) {
  value = $(object).html();
  $('#' + element_to_update_inner_html).html(value); 
  $("#" + control_to_update).val(value);
  
  element_to_update_inner_html='';
  control_to_update=''; 
  $(".selector").hide();
}

function set_bme_strategy(bme_strategy) {
  // check to see if strategy already used, if so, clear it
  leading_strategy = $('#practice_member_travel_card_leading_bme_strategy').val();
  second_strategy = $('#practice_member_travel_card_second_bme_strategy').val();
  // clear second strategy if applicable
  if(element_to_update_inner_html=='leading_bme_strategy') {
    if(second_strategy==bme_strategy) {
      $('#second_bme_strategy').html('');
      $('#practice_member_travel_card_second_bme_strategy').val('');
      
      second_strategy = '';
    }
  }
  // clear leading stragegy if applicable
  if(element_to_update_inner_html=='second_bme_strategy') {
    if(leading_strategy==bme_strategy) {
      $('#leading_bme_strategy').html('');
      $('#practice_member_travel_card_leading_bme_strategy').val('');
      
      leading_strategy = '';
    }
  }  
  
  // make the setting
  $('#' + element_to_update_inner_html).html(bme_strategy);
   
  // third strategy is virtual, not saved
  if(control_to_update!='') {
    $("#" + control_to_update).val(bme_strategy);
  }
  
  // set the third strategy inner html if first two set
  set_third_bme_strategy();

  // clear and hide
  element_to_update_inner_html='';
  control_to_update=''; 
  $('#bme_strategy_selector').hide();
}

function set_third_bme_strategy() {
  leading_strategy = $('#practice_member_travel_card_leading_bme_strategy').val();
  second_strategy = $('#practice_member_travel_card_second_bme_strategy').val();
  
  $('#third_bme_strategy').html('');
  if(leading_strategy != '' && second_strategy != '') {
    remaining_strategy = "BME";
    remaining_strategy = remaining_strategy.replace(leading_strategy,'');
    remaining_strategy = remaining_strategy.replace(second_strategy,'');
    if(remaining_strategy.length==1) $('#third_bme_strategy').html(remaining_strategy);
  }  
}
