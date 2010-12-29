// Mini Travel Card

function mini_travel_card_set_values_from_hidden_fields() {
  // get values from hidden fields and write the inner html of selectors
  // this is called on page load in body tag of application layout


	$('#mini_travel_card_level_of_care').html($('#travel_card_level_of_care').val());

	// L/R selectors
	$('#mini_travel_card_dominant_occiput').removeClass('mini_travel_card_cell'); // remove the existing color of cell if there is a value
	$('#mini_travel_card_dominant_occiput').html($('#travel_card_dominant_occiput').val()).addClass($('#travel_card_dominant_occiput').val());
	// gateways
	lr_selectors = new Array('occ_c1', 'c1_occ', 'c1_c2', 'c2_c1', 'c2_c3', 'c3_c2', 'c3_c4', 'c4_c3', 'c4_c5', 'c5_c4', 'c5_c6', 'c6_c5', 'c6_c7', 'c7_c6', 'c7_t1', 't1_c7', 't1_t2', 't2_t1', 't2_t3', 't3_t2', 's1', 's2', 's3', 's4', 's5', 'cx')
  for (key in lr_selectors) {
		value = $('#travel_card_gateway_' + lr_selectors[key]).val();
		if(value != '') $('#mini_travel_card_gateway_' + lr_selectors[key]).removeClass('mini_travel_card_cell'); // remove the existing color of cell if there is a value
		$('#mini_travel_card_gateway_' + lr_selectors[key]).html(value).addClass(value); // add class which is the color for the selected gateway
	}

  $('#mini_travel_card_leading_bme_strategy').html($('#travel_card_leading_bme_strategy').val());
  $('#mini_travel_card_second_bme_strategy').html($('#travel_card_second_bme_strategy').val());
  set_third_bme_strategy();

  $('#mini_travel_card_full_respiratory_wave').html($('#travel_card_full_respiratory_wave').val());
}


// GENERAL
function visit_set_values_from_hidden_fields() {
  // get values from hidden fields and write the inner html of selectors
  // this is called on page load in body tag of application layout
  phase_1 = $('#visit_phase_1').val();
  $('#selected_phase_1').html(phase_1);
  set_visible_fields_per_selected_phase(phase_1, "1");
  $('#selected_phase_1_gateway_1').html(add_span_to_gateway_html($('#visit_phase_1_gateway_1').val()));
  $('#selected_phase_1_gateway_1_affecting').html(add_span_to_gateway_html($('#visit_phase_1_gateway_1_affecting').val()));
  $('#selected_phase_1_gateway_2').html(add_span_to_gateway_html($('#visit_phase_1_gateway_2').val()));
  $('#selected_phase_1_gateway_2_affecting').html(add_span_to_gateway_html($('#visit_phase_1_gateway_2_affecting').val()));
  $('#selected_phase_1_direction').html($('#visit_phase_1_direction').val());
  $('#selected_phase_1_level_of_care').html($('#visit_phase_1_level_of_care').val());


  phase_2 = $('#visit_phase_2').val();
  $('#selected_phase_2').html(phase_2);
  set_visible_fields_per_selected_phase(phase_2, "2");
  $('#selected_phase_2_gateway_1').html(add_span_to_gateway_html($('#visit_phase_2_gateway_1').val()));
  $('#selected_phase_2_gateway_1_affecting').html(add_span_to_gateway_html($('#visit_phase_2_gateway_1_affecting').val()));
  $('#selected_phase_2_gateway_2').html(add_span_to_gateway_html($('#visit_phase_2_gateway_2').val()));
  $('#selected_phase_2_gateway_2_affecting').html(add_span_to_gateway_html($('#visit_phase_2_gateway_2_affecting').val()));
  $('#selected_phase_2_direction').html($('#visit_phase_2_direction').val());
  $('#selected_phase_2_level_of_care').html($('#visit_phase_2_level_of_care').val());
  // determine if we hide phase 2
  if(phase_2=='') $('.phase_2').hide();
  else $("#work_second_phase_button").hide(); // hide button if 2nd phase is showing

  $('#abduction_tension_level').html($('#visit_abduction_tension_level').val());
  $('#adduction_tension_level').html($('#visit_adduction_tension_level').val());
  $('#heel_tension_level').html($('#visit_heel_tension_level').val());
  $('#eversion_tension_level').html($('#visit_eversion_tension_level').val());
  $('#sri_stage').html($('#visit_sri_stage').val());
  $('#sri_position').html($('#visit_sri_position').val());
  $('#sri_level_of_care').html($('#visit_sri_level_of_care').val());
  $('#sri_organizing_field').html($('#visit_sri_organizing_field').val());
  $('#ingression_organizing_field').html($('#visit_ingression_organizing_field').val());
  $('#egression_organizing_field').html($('#visit_egression_organizing_field').val());
  $('#long_lever_arm').html($('#visit_long_lever_arm').val());
  $('#short_lever_arm').html($('#visit_short_lever_arm').val());
  $('#crest').html($('#visit_crest').val());
  $('#short_leg_side').html($('#visit_short_leg_side').val());
  $('#short_leg_amount').html($('#visit_short_leg_amount').val());
  $('#diagnosis').html($('#visit_diagnosis').val());

  highlight_available_gateways();
}

// note: travel_card.js handles the "hide all selectors" funciton for the practice member visit partial

/* these are class variables which hold which control is currently under
   modification so that we can use these universal functions */
var visit_phase_currently_working;
var visit_gateway_currently_working;

function set_phase_and_gateway_currently_working() {
  if(element_to_update_inner_html.indexOf("phase_1")>=0) visit_phase_currently_working = "1";
  else if(element_to_update_inner_html.indexOf("phase_2")>=0) visit_phase_currently_working = "2";
  
  if(element_to_update_inner_html.indexOf("gateway_1_affecting")>=0) visit_gateway_currently_working = "1_affecting";
  else if(element_to_update_inner_html.indexOf("gateway_2_affecting")>=0) visit_gateway_currently_working = "2_affecting";
  else if(element_to_update_inner_html.indexOf("gateway_1")>=0) visit_gateway_currently_working = "1";
  else if(element_to_update_inner_html.indexOf("gateway_2")>=0) visit_gateway_currently_working = "2";
}

// HIGHLIGHT GATEWAYS

function highlight_available_gateways() {
  
  clear_available_gateways();

  // get the phase selected on the visit
  current_phase = $('#visit_phase_' + visit_phase_currently_working).val();
  
  switch(current_phase)
  {
    // for now no phase 1 - as just about all gateways are available
      
    case "2 C1":
      $("#mini_travel_card_gateway_c1_occ").addClass("highlighted");
      $("#mini_travel_card_gateway_c1_c2").addClass("highlighted");
      break;
    
    case "2 C5":
      $("#mini_travel_card_gateway_c4_c5").addClass("highlighted");
      $("#mini_travel_card_gateway_c5_c4").addClass("highlighted");
      $("#mini_travel_card_gateway_c5_c6").addClass("highlighted");
      $("#mini_travel_card_gateway_c6_c5").addClass("highlighted");
      $("#mini_travel_card_gateway_c6_c7").addClass("highlighted");
      $("#mini_travel_card_gateway_c7_c6").addClass("highlighted");
      $("#mini_travel_card_gateway_c7_t1").addClass("highlighted");
      $("#mini_travel_card_gateway_t1_c7").addClass("highlighted");
      break;
      
    case "3":
      $("#mini_travel_card_gateway_s1").addClass("highlighted");
      $("#mini_travel_card_gateway_s2").addClass("highlighted");
      $("#mini_travel_card_gateway_s3").addClass("highlighted");
      $("#mini_travel_card_gateway_s4").addClass("highlighted");
      $("#mini_travel_card_gateway_s5").addClass("highlighted");
      $("#mini_travel_card_gateway_cx").addClass("highlighted");
      break;
    
    case "4":
      $("#mini_travel_card_gateway_c2_c1").addClass("highlighted"); 
      $("#mini_travel_card_gateway_c2_c3").addClass("highlighted");
      $("#mini_travel_card_gateway_c3_c2").addClass("highlighted");
      $("#mini_travel_card_gateway_c3_c4").addClass("highlighted");
      break;
      
    case "5":
      $("#mini_travel_card_gateway_occ_c1").addClass("highlighted");
      $("#mini_travel_card_gateway_c1_occ").addClass("highlighted");
      $("#mini_travel_card_gateway_c1_c2").addClass("highlighted");
      $("#mini_travel_card_gateway_c2_c1").addClass("highlighted"); 
      $("#mini_travel_card_gateway_c2_c3").addClass("highlighted");
      $("#mini_travel_card_gateway_c3_c2").addClass("highlighted");
      $("#mini_travel_card_gateway_c3_c4").addClass("highlighted");
      $("#mini_travel_card_gateway_c4_c3").addClass("highlighted");
      $("#mini_travel_card_gateway_c4_c5").addClass("highlighted");
      $("#mini_travel_card_gateway_c5_c4").addClass("highlighted");
      $("#mini_travel_card_gateway_c5_c6").addClass("highlighted");
      $("#mini_travel_card_gateway_c6_c5").addClass("highlighted");
      $("#mini_travel_card_gateway_c6_c7").addClass("highlighted");
      $("#mini_travel_card_gateway_c7_c6").addClass("highlighted");
      $("#mini_travel_card_gateway_c7_t1").addClass("highlighted");
      $("#mini_travel_card_gateway_t1_c7").addClass("highlighted");
      break;
  }
}

function clear_available_gateways() {
  $("#mini_travel_card_gateway_occ_c1").removeClass("highlighted"); 
  $("#mini_travel_card_gateway_c1_occ").removeClass("highlighted");
  $("#mini_travel_card_gateway_c1_c2").removeClass("highlighted");
  $("#mini_travel_card_gateway_c2_c1").removeClass("highlighted"); 
  $("#mini_travel_card_gateway_c2_c3").removeClass("highlighted");
  $("#mini_travel_card_gateway_c3_c2").removeClass("highlighted");
  $("#mini_travel_card_gateway_c3_c4").removeClass("highlighted");
  $("#mini_travel_card_gateway_c4_c3").removeClass("highlighted");
  $("#mini_travel_card_gateway_c4_c5").removeClass("highlighted");
  $("#mini_travel_card_gateway_c5_c4").removeClass("highlighted");
  $("#mini_travel_card_gateway_c5_c6").removeClass("highlighted");
  $("#mini_travel_card_gateway_c6_c5").removeClass("highlighted");
  $("#mini_travel_card_gateway_c6_c7").removeClass("highlighted");
  $("#mini_travel_card_gateway_c7_c6").removeClass("highlighted");
  $("#mini_travel_card_gateway_c7_t1").removeClass("highlighted");
  $("#mini_travel_card_gateway_t1_c7").removeClass("highlighted");
  $("#mini_travel_card_gateway_s1").removeClass("highlighted");
  $("#mini_travel_card_gateway_s2").removeClass("highlighted");
  $("#mini_travel_card_gateway_s3").removeClass("highlighted");
  $("#mini_travel_card_gateway_s4").removeClass("highlighted");
  $("#mini_travel_card_gateway_s5").removeClass("highlighted");
  $("#mini_travel_card_gateway_cx").removeClass("highlighted");
}



// PHASE
// not using universal functions here to show/set/clear as there is special logic needed
function set_phase(selected_phase) {
	
	set_selected_value_manual('selected_phase_' + visit_phase_currently_working, 'visit_phase_' + visit_phase_currently_working, selected_phase);
	

  // $('#visit_phase_' + visit_phase_currently_working).val(selected_phase);
  
  set_visible_fields_per_selected_phase(selected_phase, visit_phase_currently_working);
    
  // $('#selected_phase_' + visit_phase_currently_working).html(selected_phase); 
  $('#phase_' + visit_phase_currently_working + '_selector').hide();
  
  // clear selectors which are dependant on phase 
  clear_phase_gateway(visit_phase_currently_working, "1");
  clear_phase_gateway(visit_phase_currently_working, "1_affecting");
  clear_phase_gateway(visit_phase_currently_working, "2");
  clear_phase_gateway(visit_phase_currently_working, "2_affecting");
  
  clear_phase_direction(visit_phase_currently_working);
  $("#visit_stats_phase_" + visit_phase_currently_working).html("");
  
  // set available gateways
  highlight_available_gateways();	

	// set the direction choices -- this is mainly for phase 3 where there is one choice and we want to autopopulate it
	set_phase_direction_selector_choices(visit_phase_currently_working, selected_phase);
}

function set_visible_fields_per_selected_phase(phase, visit_phase) {
  
  if(phase==undefined) phase = "";
  
  // allow for the visit_phase parameter - mainly used for the page load initial state setting
  // where 2nd phase should not assume phase 1 (and therefore not show gateway affecting fields)
  if(visit_phase==undefined) visit_phase = visit_phase_currently_working;
  
  if(phase.indexOf('1 >')>=0) {
    // show 'gateway affecting' labels and fields for Phase 1
    $(".phase_" + visit_phase + "_affected_gateway_label").show();
    $("#selected_phase_" + visit_phase + "_gateway_1_affecting").show();
    $("#selected_phase_" + visit_phase + "_gateway_2_affecting").show();
  }
  else {
    // hide
    $(".phase_" + visit_phase + "_affected_gateway_label").hide();
    $("#selected_phase_" + visit_phase + "_gateway_1_affecting").hide();
    $("#selected_phase_" + visit_phase + "_gateway_2_affecting").hide();
    
    if(phase=="5") {
      // do not show direction - it is implied by the gateways used
      $("#phase_" + visit_phase + "_direction_label").hide();
      $("#selected_phase_" + visit_phase + "_direction").hide();
    }
    else {
      // show direction - this is not phase 5
      $("#phase_" + visit_phase + "_direction_label").show();
      $("#selected_phase_" + visit_phase + "_direction").show();
    }
    
  }
}

// GATEWAYS
// not using universal functions here to show/set/clear as there is special logic needed
function show_phase_gateway_selector() {
  // add class to the phase gateway selector div which sets what phase 
  
  // we would normally just call 'show_selector' but we need to do the
  // additional step of setting what gateways are available for both 
  // the phase and for the gateway (i.e. gateway 2 should not have
  // as an option the selcted gateway 1 value)
}

function add_span_to_gateway_html(hidden_field_gateway_value) {
  // get the first character of the string, which would be what we want to add the span to
  // if the value is 'L' or 'R'
  candidate_to_add_span = hidden_field_gateway_value.substring(0,1);
  if(candidate_to_add_span=="L" || candidate_to_add_span=="R") {
    remaining_string = hidden_field_gateway_value.substring(1);
    return "<span class=\"gateway_selector_side_highlight\">" + candidate_to_add_span + "</span>" + remaining_string;
  }
  else return hidden_field_gateway_value;
}

function remove_span_from_gateway_html(raw_gateway_value) {
  // remove <span class="gateway_selector_side_highlight">...</span> from the gateway_value
  raw_gateway_value = raw_gateway_value.replace("<span class=\"gateway_selector_side_highlight\">","");
  raw_gateway_value = raw_gateway_value.replace("</span>","");
  return raw_gateway_value;
}

function set_phase_gateway(calling_object) {
  gateway_value = $(calling_object).html();
  //gateway_value = remove_span_from_gateway_html($(calling_object).html());
  
  $('#visit_phase_' + visit_phase_currently_working + '_gateway_' + visit_gateway_currently_working).val(remove_span_from_gateway_html(gateway_value));
  $('#selected_phase_' + visit_phase_currently_working + '_gateway_' + visit_gateway_currently_working).html(gateway_value); 
  $('#phase_' + visit_phase_currently_working + '_gateway_' + visit_gateway_currently_working + '_selector').hide();
    
  // if gateway 2 is set to same as what has been selected for this gateway, clear gateway 2
  // we only want to do this if not working gateway 2
  if(visit_gateway_currently_working=="1") {
    selected_phase_gateway_2 = $('#visit_phase_' + visit_phase_currently_working + '_gateway_2').val();
    if(selected_phase_gateway_2==gateway_value) {
      // clear the second gateway as are putting the same value into gateway 1
      clear_phase_gateway(visit_phase_currently_working,"2");
    }
  }
  
  // do the same as above for gateway 2 affecting 
  if(visit_gateway_currently_working=="1_affecting") {
    selected_phase_gateway_2_affecting = $('#visit_phase_' + visit_phase_currently_working + '_gateway_2_affecting').val();
    if(selected_phase_gateway_2_affecting==gateway_value) {
      // clear the second gateway as are putting the same value into gateway 1
      clear_phase_gateway(visit_phase_currently_working,"2_affecting");
    }
  }
  
  
  $(".selector").hide(); 
}

function clear_phase_gateway(visit_phase, visit_gateway) {
  // remove all gateway settings for selected phase and gateway
  // inputs are '1' or '2' for phase (this is not the NSA phase but the phase in the visit)
  // and '1' or '2' for gateway
  
  // if signature params are defined, these override the global 'visit_phase...' and 'visit_gateway...'
  if(visit_phase==undefined) visit_phase = visit_phase_currently_working;
  if(visit_gateway==undefined) visit_gateway = visit_gateway_currently_working;
  
  $('#visit_phase_' + visit_phase + '_gateway_' + visit_gateway).val('');
  $('#selected_phase_' + visit_phase + '_gateway_' + visit_gateway).html(''); 
  set_phase_gateway_selector_choices('1', '', '');
  $(".selector").hide();  
}

function set_phase_gateway_selector_choices(selected_phase) {

  // set the 'filter for' - this is the name of the field which should not be duplicated,
  // i.e. the selector choises for gateway 2 should not have in its array the selected 
  // value of gateway 1, same for gateway 2 affected against gateway 1 affected
  limit_gateway = "";
  // get the gateway or gateway affecting (if 2, then is 1, if 2 affecting, is 1 affecting to limit)
  if(visit_gateway_currently_working=="2") limit_gateway = "1";
  if(visit_gateway_currently_working=="2_affecting") limit_gateway = "1_affecting";
  if(limit_gateway!="") {
    filter_for_gateway = $('#visit_phase_' + visit_phase_currently_working + '_gateway_' + limit_gateway).val();    
  }
  else filter_for_gateway = "";

  $(".gateway_selection_cell").hide();
  
  // always show the blank selector element. if no phase, prompt for phase
  $('#select_gateway_no_gateway').show();  
  if(selected_phase=='') {
    $('#select_gateway_no_gateway').html('please select a phase');
  }
  else {
    $('#select_gateway_no_gateway').html(' ');
  }
  
  switch(selected_phase)
  {
    case "1 > 2 C1":
      switch(visit_gateway_currently_working) {
        case "1":
        case "2":
          if(filter_for_gateway.indexOf('OCC')==-1) $('#select_gateway_occ').show();
          if(filter_for_gateway.indexOf('S1')==-1) $('#select_gateway_s1').show();
          if(filter_for_gateway.indexOf('S2')==-1) $('#select_gateway_s2').show();
          if(filter_for_gateway.indexOf('S3')==-1) $('#select_gateway_s3').show();
          if(filter_for_gateway.indexOf('S4')==-1) $('#select_gateway_s4').show();
          if(filter_for_gateway.indexOf('S5')==-1) $('#select_gateway_s5').show();
          if(filter_for_gateway.indexOf('CX')==-1) $('#select_gateway_cx').show();
          break;
        case "1_affecting":
        case "2_affecting":
          if(filter_for_gateway.indexOf('C1/OCC')==-1) $('#select_gateway_c1_occ').show();
          if(filter_for_gateway.indexOf('C1/C2')==-1) $('#select_gateway_c1_c2').show();
          break;
      }
      break;
      
    case "1 > 2 C5":
      switch(visit_gateway_currently_working) {
        case "1":
        case "2":
          if(filter_for_gateway.indexOf('OCC')==-1) $('#select_gateway_occ').show();
          if(filter_for_gateway.indexOf('S1')==-1) $('#select_gateway_s1').show();
          if(filter_for_gateway.indexOf('S2')==-1) $('#select_gateway_s2').show();
          if(filter_for_gateway.indexOf('S3')==-1) $('#select_gateway_s3').show();
          if(filter_for_gateway.indexOf('S4')==-1) $('#select_gateway_s4').show();
          if(filter_for_gateway.indexOf('S5')==-1) $('#select_gateway_s5').show();
          if(filter_for_gateway.indexOf('CX')==-1) $('#select_gateway_cx').show();
          break;
        case "1_affecting":
        case "2_affecting":
          if(filter_for_gateway.indexOf('C3/C4')==-1) $('#select_gateway_c3_c4').show();
          if(filter_for_gateway.indexOf('C4/C3')==-1) $('#select_gateway_c4_c3').show();
          if(filter_for_gateway.indexOf('C4/C5')==-1) $('#select_gateway_c4_c5').show();
          if(filter_for_gateway.indexOf('C5/C4')==-1) $('#select_gateway_c5_c4').show();
          if(filter_for_gateway.indexOf('C5/C6')==-1) $('#select_gateway_c5_c6').show();
          if(filter_for_gateway.indexOf('C6/C5')==-1) $('#select_gateway_c6_c5').show();
          if(filter_for_gateway.indexOf('C6/C7')==-1) $('#select_gateway_c6_c7').show();
          if(filter_for_gateway.indexOf('C7/C6')==-1) $('#select_gateway_c7_c6').show();
          if(filter_for_gateway.indexOf('C7/T1')==-1) $('#select_gateway_c7_t1').show();
          if(filter_for_gateway.indexOf('T1/C7')==-1) $('#select_gateway_t1_c7').show();
          if(filter_for_gateway.indexOf('T1/T2')==-1) $('#select_gateway_t1_t2').show();
          if(filter_for_gateway.indexOf('T2/T1')==-1) $('#select_gateway_t2_t1').show();
          if(filter_for_gateway.indexOf('T2/T3')==-1) $('#select_gateway_t2_t3').show();
          if(filter_for_gateway.indexOf('T3/T2')==-1) $('#select_gateway_t3_t2').show();  
          break;
      }
      break;
      
    case "1 > 3":
      switch(visit_gateway_currently_working) {
        case "1":
        case "2":
          if(filter_for_gateway.indexOf('OCC')==-1) $('#select_gateway_occ').show();
          if(filter_for_gateway.indexOf('S1')==-1) $('#select_gateway_s1').show();
          if(filter_for_gateway.indexOf('S2')==-1) $('#select_gateway_s2').show();
          if(filter_for_gateway.indexOf('S3')==-1) $('#select_gateway_s3').show();
          if(filter_for_gateway.indexOf('S4')==-1) $('#select_gateway_s4').show();
          if(filter_for_gateway.indexOf('S5')==-1) $('#select_gateway_s5').show();
          if(filter_for_gateway.indexOf('CX')==-1) $('#select_gateway_cx').show();
          if(visit_gateway_currently_working=="2") {
            if(filter_for_gateway.indexOf('APEX')==-1) $('#select_gateway_apex').show();
          }
          break;
        case "1_affecting":
        case "2_affecting":
          if(filter_for_gateway.indexOf('S1')==-1) $('#select_gateway_s1').show();
          if(filter_for_gateway.indexOf('S2')==-1) $('#select_gateway_s2').show();
          if(filter_for_gateway.indexOf('S3')==-1) $('#select_gateway_s3').show();
          if(filter_for_gateway.indexOf('S4')==-1) $('#select_gateway_s4').show();
          if(filter_for_gateway.indexOf('S5')==-1) $('#select_gateway_s5').show();
          if(filter_for_gateway.indexOf('CX')==-1) $('#select_gateway_cx').show();
          break;
      }
      break;
      
    case "1 > 4":
      switch(visit_gateway_currently_working) {
        case "1":
        case "2":
          if(filter_for_gateway.indexOf('OCC')==-1) $('#select_gateway_occ').show();
          if(filter_for_gateway.indexOf('S1')==-1) $('#select_gateway_s1').show();
          if(filter_for_gateway.indexOf('S2')==-1) $('#select_gateway_s2').show();
          if(filter_for_gateway.indexOf('S3')==-1) $('#select_gateway_s3').show();
          if(filter_for_gateway.indexOf('S4')==-1) $('#select_gateway_s4').show();
          if(filter_for_gateway.indexOf('S5')==-1) $('#select_gateway_s5').show();
          if(filter_for_gateway.indexOf('CX')==-1) $('#select_gateway_cx').show();
          break;
        case "1_affecting":
        case "2_affecting":
          if(filter_for_gateway.indexOf('C2/C1')==-1) $('#select_gateway_c2_c1').show();
          if(filter_for_gateway.indexOf('C2/C3')==-1) $('#select_gateway_c2_c3').show();
          if(filter_for_gateway.indexOf('C3/C2')==-1) $('#select_gateway_c3_c2').show();
          if(filter_for_gateway.indexOf('C3/C4')==-1) $('#select_gateway_c3_c4').show();
          break;
      }
      break;
      
    case "1 > 5":
      switch(visit_gateway_currently_working) {
        case "1":
        case "2":
          if(filter_for_gateway.indexOf('OCC')==-1) $('#select_gateway_occ').show();
          if(filter_for_gateway.indexOf('S1')==-1) $('#select_gateway_s1').show();
          if(filter_for_gateway.indexOf('S2')==-1) $('#select_gateway_s2').show();
          if(filter_for_gateway.indexOf('S3')==-1) $('#select_gateway_s3').show();
          if(filter_for_gateway.indexOf('S4')==-1) $('#select_gateway_s4').show();
          if(filter_for_gateway.indexOf('S5')==-1) $('#select_gateway_s5').show();
          if(filter_for_gateway.indexOf('CX')==-1) $('#select_gateway_cx').show();
          break;
        case "1_affecting":
        case "2_affecting":
          if(visit_gateway_currently_working=="1" || visit_gateway_currently_working == "1_affecting") {
            // gateway 1 selections
            if(filter_for_gateway.indexOf('OCC')==-1) $('#select_gateway_occ').show();
            if(filter_for_gateway.indexOf('OCC/C1')==-1) $('#select_gateway_occ_c1').show();
            if(filter_for_gateway.indexOf('C1/OCC')==-1) $('#select_gateway_c1_occ').show();
            if(filter_for_gateway.indexOf('C1/C2')==-1) $('#select_gateway_c1_c2').show();
            if(filter_for_gateway.indexOf('C2/C1')==-1) $('#select_gateway_c2_c1').show();
            if(filter_for_gateway.indexOf('C2/C3')==-1) $('#select_gateway_c2_c3').show();
            if(filter_for_gateway.indexOf('C3/C2')==-1) $('#select_gateway_c3_c2').show();
            if(filter_for_gateway.indexOf('C3/C4')==-1) $('#select_gateway_c3_c4').show();
            if(filter_for_gateway.indexOf('C4/C3')==-1) $('#select_gateway_c4_c3').show();
            if(filter_for_gateway.indexOf('C4/C5')==-1) $('#select_gateway_c4_c5').show();
            if(filter_for_gateway.indexOf('C5/C4')==-1) $('#select_gateway_c5_c4').show();
            if(filter_for_gateway.indexOf('C5/C6')==-1) $('#select_gateway_c5_c6').show();
            if(filter_for_gateway.indexOf('C6/C5')==-1) $('#select_gateway_c6_c5').show();
            if(filter_for_gateway.indexOf('C6/C7')==-1) $('#select_gateway_c6_c7').show();
            if(filter_for_gateway.indexOf('C7/C6')==-1) $('#select_gateway_c7_c6').show();
            if(filter_for_gateway.indexOf('C7/T1')==-1) $('#select_gateway_c7_t1').show();
            if(filter_for_gateway.indexOf('T1/C7')==-1) $('#select_gateway_t1_c7').show();
            if(filter_for_gateway.indexOf('T1/T2')==-1) $('#select_gateway_t1_t2').show();
            if(filter_for_gateway.indexOf('T2/T1')==-1) $('#select_gateway_t2_t1').show();
            if(filter_for_gateway.indexOf('T2/T3')==-1) $('#select_gateway_t2_t3').show();
            if(filter_for_gateway.indexOf('T3/T2')==-1) $('#select_gateway_t3_t2').show();
          } else {
            // gateway 2 selections
            if(filter_for_gateway.indexOf('CX')==-1) $('#select_gateway_cx').show();
            if(filter_for_gateway.indexOf('APEX')==-1) $('#select_gateway_apex').show();
          }
          break;
      }
      break;
      
    case "2 C1":
      if(filter_for_gateway.indexOf('C1/OCC')==-1) $('#select_gateway_c1_occ').show();
      if(filter_for_gateway.indexOf('C1/C2')==-1) $('#select_gateway_c1_c2').show();
      break;

    case "2 C5":
      if(filter_for_gateway.indexOf('C3/C4')==-1) $('#select_gateway_c3_c4').show();
      if(filter_for_gateway.indexOf('C4/C3')==-1) $('#select_gateway_c4_c3').show();
      if(filter_for_gateway.indexOf('C4/C5')==-1) $('#select_gateway_c4_c5').show();
      if(filter_for_gateway.indexOf('C5/C4')==-1) $('#select_gateway_c5_c4').show();
      if(filter_for_gateway.indexOf('C5/C6')==-1) $('#select_gateway_c5_c6').show();
      if(filter_for_gateway.indexOf('C6/C5')==-1) $('#select_gateway_c6_c5').show();
      if(filter_for_gateway.indexOf('C6/C7')==-1) $('#select_gateway_c6_c7').show();
      if(filter_for_gateway.indexOf('C7/C6')==-1) $('#select_gateway_c7_c6').show();
      if(filter_for_gateway.indexOf('C7/T1')==-1) $('#select_gateway_c7_t1').show();
      if(filter_for_gateway.indexOf('T1/C7')==-1) $('#select_gateway_t1_c7').show();
      if(filter_for_gateway.indexOf('T1/T2')==-1) $('#select_gateway_t1_t2').show();
      if(filter_for_gateway.indexOf('T2/T1')==-1) $('#select_gateway_t2_t1').show();
      if(filter_for_gateway.indexOf('T2/T3')==-1) $('#select_gateway_t2_t3').show();
      if(filter_for_gateway.indexOf('T3/T2')==-1) $('#select_gateway_t3_t2').show();
      
      break;

    case "3": 
      if(filter_for_gateway.indexOf('S1')==-1) $('#select_gateway_s1').show();
      if(filter_for_gateway.indexOf('S2')==-1) $('#select_gateway_s2').show();
      if(filter_for_gateway.indexOf('S3')==-1) $('#select_gateway_s3').show();
      if(filter_for_gateway.indexOf('S4')==-1) $('#select_gateway_s4').show();
      if(filter_for_gateway.indexOf('S5')==-1) $('#select_gateway_s5').show();
      if(filter_for_gateway.indexOf('CX')==-1) $('#select_gateway_cx').show();
      if(visit_gateway_currently_working=="2") {
        if(filter_for_gateway.indexOf('APEX')==-1) $('#select_gateway_apex').show();
      }
      break;

    case "4":
      if(filter_for_gateway.indexOf('C2/C1')==-1) $('#select_gateway_c2_c1').show();
      if(filter_for_gateway.indexOf('C2/C3')==-1) $('#select_gateway_c2_c3').show();
      if(filter_for_gateway.indexOf('C3/C2')==-1) $('#select_gateway_c3_c2').show();
      if(filter_for_gateway.indexOf('C3/C4')==-1) $('#select_gateway_c3_c4').show();
      break;

    case "5":
      if(visit_gateway_currently_working=="1" || visit_gateway_currently_working == "1_affecting") {
        // gateway 1 selections
        if(filter_for_gateway.indexOf('OCC')==-1) $('#select_gateway_occ').show();
        if(filter_for_gateway.indexOf('OCC/C1')==-1) $('#select_gateway_occ_c1').show();
        if(filter_for_gateway.indexOf('C1/OCC')==-1) $('#select_gateway_c1_occ').show();
        if(filter_for_gateway.indexOf('C1/C2')==-1) $('#select_gateway_c1_c2').show();
        if(filter_for_gateway.indexOf('C2/C1')==-1) $('#select_gateway_c2_c1').show();
        if(filter_for_gateway.indexOf('C2/C3')==-1) $('#select_gateway_c2_c3').show();
        if(filter_for_gateway.indexOf('C3/C2')==-1) $('#select_gateway_c3_c2').show();
        if(filter_for_gateway.indexOf('C3/C4')==-1) $('#select_gateway_c3_c4').show();
        if(filter_for_gateway.indexOf('C4/C3')==-1) $('#select_gateway_c4_c3').show();
        if(filter_for_gateway.indexOf('C4/C5')==-1) $('#select_gateway_c4_c5').show();
        if(filter_for_gateway.indexOf('C5/C4')==-1) $('#select_gateway_c5_c4').show();
        if(filter_for_gateway.indexOf('C5/C6')==-1) $('#select_gateway_c5_c6').show();
        if(filter_for_gateway.indexOf('C6/C5')==-1) $('#select_gateway_c6_c5').show();
        if(filter_for_gateway.indexOf('C6/C7')==-1) $('#select_gateway_c6_c7').show();
        if(filter_for_gateway.indexOf('C7/C6')==-1) $('#select_gateway_c7_c6').show();
        if(filter_for_gateway.indexOf('C7/T1')==-1) $('#select_gateway_c7_t1').show();
        if(filter_for_gateway.indexOf('T1/C7')==-1) $('#select_gateway_t1_c7').show();
        if(filter_for_gateway.indexOf('T1/T2')==-1) $('#select_gateway_t1_t2').show();
        if(filter_for_gateway.indexOf('T2/T1')==-1) $('#select_gateway_t2_t1').show();
        if(filter_for_gateway.indexOf('T2/T3')==-1) $('#select_gateway_t2_t3').show();
        if(filter_for_gateway.indexOf('T3/T2')==-1) $('#select_gateway_t3_t2').show();
      } else {
        // gateway 2 selections
        if(filter_for_gateway.indexOf('CX')==-1) $('#select_gateway_cx').show();
        if(filter_for_gateway.indexOf('APEX')==-1) $('#select_gateway_apex').show();
      }     
      break;
  }
}

// DIRECTION
// not using universal functions here to show/set/clear as there is special logic needed
function set_phase_direction(direction) {
  $('#visit_phase_' + visit_phase_currently_working + '_direction').val(direction);
  $('#selected_phase_' + visit_phase_currently_working + '_direction').html(direction); 
  $('.selector').hide();
}

function clear_phase_direction(visit_phase) {
  $('#visit_phase_' + visit_phase + '_direction').val('');
  
  $('#selected_phase_' + visit_phase + '_direction').html(''); 
  set_phase_direction_selector_choices(visit_phase, '');
  $(".selector").hide();
}

function set_phase_direction_selector_choices(visit_phase, phase) {
  
  hide_all_phase_directions(visit_phase);
  
  // always show the 'remove' selector element. if no phase, prompt for phase
  $('#no_phase_' + visit_phase + '_direction').show();  
  if($('#visit_phase_' + visit_phase).val()=='') {
    $('#no_phase_' + visit_phase + '_direction').html('please select a phase');
  }
  else {
    $('#no_phase_' + visit_phase + '_direction').html(' ');
  }
  
  switch(phase)
  {
    case "1 > 2 C1":
    case "1 > 2 C5":
    case "1 > 3":
    case "1 > 4":
    case "1 > 5":
      $('#phase_' + visit_phase + '_direction_M').show();
      $('#phase_' + visit_phase + '_direction_L').show();
      break;
      
    case "2 C1": 
    case "2 C5":
    case "4":
      $('#phase_' + visit_phase + '_direction_F_E').show();
      $('#phase_' + visit_phase + '_direction_L_B').show();
      break;
      
    case "3":   
			// since only one direction set it in the field -- no selector
			$('#selected_phase_' + visit_phase + '_direction').html('L/B');
      break;
      
    case "5":
      // show none as is either cx or apex and this is set in gateways
      break;
  }
}

function hide_all_phase_directions(visit_phase) {
  
  $('#phase_' + visit_phase + '_direction_M').hide();
  $('#phase_' + visit_phase + '_direction_L').hide();
  $('#phase_' + visit_phase + '_direction_F_E').hide();
  $('#phase_' + visit_phase + '_direction_L_B').hide();
  $('#no_phase_' + visit_phase + '_direction').hide();
  
}
