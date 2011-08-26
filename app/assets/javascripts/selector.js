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

        selected_phase = $('#visit_phase_' + visit_phase_currently_working).val();

				set_phase_gateway_selector_visible_text();

        set_phase_gateway_selector_choices(selected_phase);
      }
      else if(selector_name=="phase_direction_selector") {

        set_phase_and_gateway_currently_working();

        selected_phase = $('#visit_phase_' + visit_phase_currently_working).val();

        set_phase_direction_selector_choices(visit_phase_currently_working, selected_phase);
      }
      else if(selector_name.indexOf("phase")>=0) {
        set_phase_and_gateway_currently_working();
      }

      eleOffset = $(calling_object).offset();
      left = eleOffset.left + 'px';
      topp = eleOffset.top + 'px';
      $(".selector").hide();
      $('#' + selector_name).css("left",left).css("top",topp).css("position","absolute");
      $('#' + selector_name).show('fast');
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

  if(current_value=="") $(object).html("L").addClass('L');
  else if(current_value=="L") $(object).html("R").addClass('R');
  else $(object).html('').removeClass('L').removeClass('R');

  set_selected_value(object);
}

