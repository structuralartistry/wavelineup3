function travel_card_set_values_from_hidden_fields() {
  // get values from hidden fields and write the inner html of selectors
  // this is called on page load in body tag of application layout

	$('#level_of_care').html($('#travel_card_level_of_care').val());

	// L/R selectors
	$('#dominant_occiput').html($('#travel_card_dominant_occiput').val()).addClass($('#travel_card_dominant_occiput').val());
	// gateways
	lr_selectors = new Array('occ_c1', 'c1_occ', 'c1_c2', 'c2_c1', 'c2_c3', 'c3_c2', 'c3_c4', 'c4_c3', 'c4_c5', 'c5_c4', 'c5_c6', 'c6_c5', 'c6_c7', 'c7_c6', 'c7_t1', 't1_c7', 't1_t2', 't2_t1', 't2_t3', 't3_t2', 's1', 's2', 's3', 's4', 's5', 'cx')
  for (key in lr_selectors) {
		value = $('#travel_card_gateway_' + lr_selectors[key]).val();
		$('#gateway_' + lr_selectors[key]).html(value).addClass(value); // add class which is the color for the selected gateway
	}

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

function add_color_class_to_gateway(id, gateway_setting) {
	if(gateway_setting == 'L') $(object).addClass('left');
	else if (gateway_setting == 'R') $(object).addClass('right');
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
  set_third_bme_strategy(false);

  // clear and hide
  element_to_update_inner_html='';
  control_to_update='';
  $('#bme_strategy_selector').hide('fast');
}

function set_third_bme_strategy(mini_travel_card) {
	mini_tc_prefix = '';
	if(mini_travel_card==true) {
		mini_tc_prefix = 'mini_travel_card_';
	}

  leading_strategy = $('#travel_card_leading_bme_strategy').val();
  second_strategy = $('#travel_card_second_bme_strategy').val();

  $('#third_bme_strategy').html('');
  if(leading_strategy != '' && second_strategy != '') {
    remaining_strategy = "BME";
    remaining_strategy = remaining_strategy.replace(leading_strategy,'');
    remaining_strategy = remaining_strategy.replace(second_strategy,'');
    if(remaining_strategy.length == 1) $('#' + mini_tc_prefix + 'third_bme_strategy').html(remaining_strategy);
  }
}


