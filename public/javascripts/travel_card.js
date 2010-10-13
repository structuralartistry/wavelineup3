function travel_card_set_values_from_hidden_fields() {
  // get values from hidden fields and write the inner html of selectors
  // this is called on page load in body tag of application layout
  $('#dominant_occiput').html($('#travel_card_dominant_occiput').val());
  $('#level_of_care').html($('#travel_card_level_of_care').val());
  $('#gateway_occ_c1').html($('#travel_card_gateway_occ_c1').val());
  $('#gateway_c1_occ').html($('#travel_card_gateway_c1_occ').val());
  $('#gateway_c1_c2').html($('#travel_card_gateway_c1_c2').val());
  $('#gateway_c2_c1').html($('#travel_card_gateway_c2_c1').val());
  $('#gateway_c2_c3').html($('#travel_card_gateway_c2_c3').val());
  $('#gateway_c3_c2').html($('#travel_card_gateway_c3_c2').val());
  $('#gateway_c3_c4').html($('#travel_card_gateway_c3_c4').val());
  $('#gateway_c4_c3').html($('#travel_card_gateway_c4_c3').val());
  $('#gateway_c4_c5').html($('#travel_card_gateway_c4_c5').val());
  $('#gateway_c5_c4').html($('#travel_card_gateway_c5_c4').val());
  $('#gateway_c5_c6').html($('#travel_card_gateway_c5_c6').val());
  $('#gateway_c6_c5').html($('#travel_card_gateway_c6_c5').val());
  $('#gateway_c6_c7').html($('#travel_card_gateway_c6_c7').val());
  $('#gateway_c7_c6').html($('#travel_card_gateway_c7_c6').val());
  $('#gateway_c7_t1').html($('#travel_card_gateway_c7_t1').val());
  $('#gateway_t1_c7').html($('#travel_card_gateway_t1_c7').val());
  $('#gateway_t1_t2').html($('#travel_card_gateway_t1_t2').val());
  $('#gateway_t2_t1').html($('#travel_card_gateway_t2_t1').val());
  $('#gateway_t2_t3').html($('#travel_card_gateway_t2_t3').val());
  $('#gateway_t3_t2').html($('#travel_card_gateway_t3_t2').val());
  $('#gateway_s1').html($('#travel_card_gateway_s1').val());
  $('#gateway_s2').html($('#travel_card_gateway_s2').val());
  $('#gateway_s3').html($('#travel_card_gateway_s3').val());
  $('#gateway_s4').html($('#travel_card_gateway_s4').val());
  $('#gateway_s5').html($('#travel_card_gateway_s5').val());
  $('#gateway_cx').html($('#travel_card_gateway_cx').val());

  $('#leading_bme_strategy').html($('#travel_card_leading_bme_strategy').val());
  $('#second_bme_strategy').html($('#travel_card_second_bme_strategy').val());
  set_third_bme_strategy();

  $('#full_respiratory_wave').html($('#travel_card_full_respiratory_wave').val());

  $('#passive_c1_c7_tension_level').html($('#travel_card_passive_c1_c7_tension_level').val());
  $('#passive_t1_t12_tension_level').html($('#travel_card_passive_t1_t12_tension_level').val());
  $('#passive_l1_l5_tension_level').html($('#travel_card_passive_l1_l5_tension_level').val());
  $('#passive_s1_cx_tension_level').html($('#travel_card_passive_s1_cx_tension_level').val());
  $('#active_c1_c7_tension_level').html($('#travel_card_active_c1_c7_tension_level').val());
  $('#active_t1_t12_tension_level').html($('#travel_card_active_t1_t12_tension_level').val());
  $('#active_l1_l5_tension_level').html($('#travel_card_active_l1_l5_tension_level').val());
  $('#active_s1_cx_tension_level').html($('#travel_card_active_s1_cx_tension_level').val());

  $('#sri_position_1_level_of_awareness').html($('#travel_card_sri_position_1_level_of_awareness').val());
  $('#sri_position_2_level_of_awareness').html($('#travel_card_sri_position_2_level_of_awareness').val());
  $('#sri_position_3_level_of_awareness').html($('#travel_card_sri_position_3_level_of_awareness').val());
  $('#sri_safety_position').html($('#travel_card_sri_safety_position').val());
  $('#buzz_words_for_sri').html($('#travel_card_buzz_words_for_sri').val());
  
  $('#book_12_stages').html($('#travel_card_book_12_stages').val());
  $('#book_healing_magic').html($('#travel_card_book_healing_magic').val());
  $('#number_gate').html($('#travel_card_number_gate').val());
  $('#number_hip').html($('#travel_card_number_hip').val());
  $('#number_ultima').html($('#travel_card_number_ultima').val());
  $('#number_ultimatum').html($('#travel_card_number_ultimatum').val());
  $('#number_sri').html($('#travel_card_number_sri').val());  
}

function show_selector(selector_name, calling_object, _element_to_update_inner_html, _control_to_update) {
  // set the global vars
  element_to_update_inner_html=_element_to_update_inner_html;
  control_to_update=_control_to_update;
  
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
  $('#' + control_to_update).val(value);

  autosave(control_to_update, $('#' + control_to_update).val());
  
  element_to_update_inner_html='';
  control_to_update=''; 
  $(".selector").hide();
}

function set_bme_strategy(bme_strategy) {
  // check to see if strategy already used, if so, clear it
  leading_strategy = $('#travel_card_leading_bme_strategy').val();
  second_strategy = $('#travel_card_second_bme_strategy').val();
  // clear second strategy if applicable
  if(element_to_update_inner_html=='leading_bme_strategy') {
    if(second_strategy==bme_strategy) {
      $('#second_bme_strategy').html('');
      $('#travel_card_second_bme_strategy').val('');
      
      second_strategy = '';
    }
  }
  // clear leading stragegy if applicable
  if(element_to_update_inner_html=='second_bme_strategy') {
    if(leading_strategy==bme_strategy) {
      $('#leading_bme_strategy').html('');
      $('#travel_card_leading_bme_strategy').val('');
      
      leading_strategy = '';
    }
  }  
  
  // make the setting
  $('#' + element_to_update_inner_html).html(bme_strategy);
   
  // third strategy is virtual, not saved
  if(control_to_update!='') {
    $("#" + control_to_update).val(bme_strategy);
  }
  
  // autosave
  autosave('travel_card_leading_bme_strategy', $('#travel_card_leading_bme_strategy').val());
  autosave('travel_card_second_bme_strategy', $('#travel_card_second_bme_strategy').val());
  
  // set the third strategy inner html if first two set
  set_third_bme_strategy();

  // clear and hide
  element_to_update_inner_html='';
  control_to_update=''; 
  $('#bme_strategy_selector').hide();
}

function set_third_bme_strategy() {
  leading_strategy = $('#travel_card_leading_bme_strategy').val();
  second_strategy = $('#travel_card_second_bme_strategy').val();
  
  $('#third_bme_strategy').html('');
  if(leading_strategy != '' && second_strategy != '') {
    remaining_strategy = "BME";
    remaining_strategy = remaining_strategy.replace(leading_strategy,'');
    remaining_strategy = remaining_strategy.replace(second_strategy,'');
    if(remaining_strategy.length == 1) $('#third_bme_strategy').html(remaining_strategy);
  }  
}


function autosave(control_id, value) {
  // ascertain the controller, field name and record id to be saved
  controller = "";
  record_id = "";
  field = "";
      
  if(control_id.indexOf("travel_card")>=0) {
    controller = "travel_cards";
    qualified_field = "travel_card[" + control_id.replace("travel_card_", "") + "]";
    record_id = $("#travel_card_practice_member_id").val();
    update_field_to_server(controller, record_id, qualified_field, value);
    return;
  }
  
}

// AUTOSAVE FUNCTION
// every time a field is changed, post the form... later may want to make this more efficient
// this uese rails convention with the assumption of an update method for all controllers which
function update_field_to_server(controller, record_id, qualified_field, value) {
  // format the data to put
  field_data = qualified_field + "=" + value;
    
  $.ajax({
            type: "PUT",
            url: "/" + controller + "/" + record_id,
            data: field_data,
            dataType: "script"
            //success: alert(msg),
            //failure: alert(msg)
  });
  
}

