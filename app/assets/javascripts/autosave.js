var element_to_update_inner_html;
var control_to_update;

function set_selected_value(object) {
  value = $(object).html();
  $('#' + element_to_update_inner_html).html(value); 
  $('#' + control_to_update).val(value);

  autosave(control_to_update, $('#' + control_to_update).val());
  
  element_to_update_inner_html='';
  control_to_update=''; 
  $(".selector").hide('fast');
}

function set_selected_value_manual(element_to_update_inner_html, control_to_update, value) {
  $('#' + element_to_update_inner_html).html(value); 
  $('#' + control_to_update).val(value);

  autosave(control_to_update, $('#' + control_to_update).val());	
}

function autosave(control_id, value) {
  $('#transmitting').show();
  
  // ascertain the controller, field name and record id to be saved
  controller = "";
  record_id = "";
  field = "";
    
  if(control_id.indexOf("travel_card")>=0) {
    controller = "travel_cards";
    qualified_field = "travel_card[" + control_id.replace("travel_card_", "") + "]";
    record_id = $("#travel_card_id").val();
    update_field_to_server(controller, record_id, qualified_field, value);
		$('#' + control_id).val(value);
    return;
  }  

  if(control_id.indexOf("visit")>=0) {
    controller = "visits";
    qualified_field = "visit[" + control_id.replace("visit_", "") + "]";
    record_id = $("#visit_id").val();
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
