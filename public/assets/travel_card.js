function travel_card_set_values_from_hidden_fields(){$("#level_of_care").html($("#travel_card_level_of_care").val());$("#dominant_occiput").html($("#travel_card_dominant_occiput").val()).addClass($("#travel_card_dominant_occiput").val());lr_selectors=new Array("occ_c1","c1_occ","c1_c2","c2_c1","c2_c3","c3_c2","c3_c4","c4_c3","c4_c5","c5_c4","c5_c6","c6_c5","c6_c7","c7_c6","c7_t1","t1_c7","t1_t2","t2_t1","t2_t3","t3_t2","s1","s2","s3","s4","s5","cx");for(key in lr_selectors){value=$("#travel_card_gateway_"+lr_selectors[key]).val();$("#gateway_"+lr_selectors[key]).html(value).addClass(value)}$("#leading_bme_strategy").html($("#travel_card_leading_bme_strategy").val());$("#second_bme_strategy").html($("#travel_card_second_bme_strategy").val());set_third_bme_strategy();$("#full_respiratory_wave").html($("#travel_card_full_respiratory_wave").val());$("#passive_c1_c7_tension_level").html($("#travel_card_passive_c1_c7_tension_level").val());$("#passive_t1_t12_tension_level").html($("#travel_card_passive_t1_t12_tension_level").val());$("#passive_l1_l5_tension_level").html($("#travel_card_passive_l1_l5_tension_level").val());$("#passive_s1_cx_tension_level").html($("#travel_card_passive_s1_cx_tension_level").val());$("#active_c1_c7_tension_level").html($("#travel_card_active_c1_c7_tension_level").val());$("#active_t1_t12_tension_level").html($("#travel_card_active_t1_t12_tension_level").val());$("#active_l1_l5_tension_level").html($("#travel_card_active_l1_l5_tension_level").val());$("#active_s1_cx_tension_level").html($("#travel_card_active_s1_cx_tension_level").val());$("#sri_position_1_level_of_awareness").html($("#travel_card_sri_position_1_level_of_awareness").val());$("#sri_position_2_level_of_awareness").html($("#travel_card_sri_position_2_level_of_awareness").val());$("#sri_position_3_level_of_awareness").html($("#travel_card_sri_position_3_level_of_awareness").val());$("#sri_safety_position").html($("#travel_card_sri_safety_position").val());$("#buzz_words_for_sri").html($("#travel_card_buzz_words_for_sri").val());$("#book_12_stages").html($("#travel_card_book_12_stages").val());$("#book_healing_magic").html($("#travel_card_book_healing_magic").val());$("#number_gate").html($("#travel_card_number_gate").val());$("#number_hip").html($("#travel_card_number_hip").val());$("#number_ultima").html($("#travel_card_number_ultima").val());$("#number_ultimatum").html($("#travel_card_number_ultimatum").val());$("#number_sri").html($("#travel_card_number_sri").val())}function show_selector(d,c,a,b){element_to_update_inner_html=a;control_to_update=b;switch(d){case"boolean_selector":boolean_toggle_selected_value(c);break;case"side_selector":left_right_toggle_selected_value(c);break;default:if(d=="phase_gateway_selector"){set_phase_and_gateway_currently_working();selected_phase=$("#practice_member_visit_phase_"+visit_phase_currently_working).val();set_phase_gateway_selector_choices(selected_phase)}else{if(d=="phase_direction_selector"){set_phase_and_gateway_currently_working();selected_phase=$("#practice_member_visit_phase_"+visit_phase_currently_working).val();set_phase_direction_selector_choices(visit_phase_currently_working,selected_phase)}else{if(d.indexOf("phase")>=0){set_phase_and_gateway_currently_working()}}}eleOffset=$(c).offset();left=eleOffset.left+"px";topp=eleOffset.top+"px";$(".selector").hide();$("#"+d).css("left",left).css("top",topp).css("position","absolute");$("#"+d).show("fast");break}}function boolean_toggle_selected_value(a){current_value=$(a).html();if(current_value=="X"){$(a).html("")}else{$(a).html("X")}set_selected_value(a)}function left_right_toggle_selected_value(a){current_value=$(a).html();if(current_value==""){$(a).html("L").addClass("L")}else{if(current_value=="L"){$(a).html("R").addClass("R")}else{$(a).html("").removeClass("L").removeClass("R")}}set_selected_value(a)}function add_color_class_to_gateway(b,a){if(a=="L"){$(object).addClass("left")}else{if(a=="R"){$(object).addClass("right")}}}function set_selected_value(a){value=$(a).html();$("#"+element_to_update_inner_html).html(value);$("#"+control_to_update).val(value);autosave(control_to_update,$("#"+control_to_update).val());element_to_update_inner_html="";control_to_update="";$(".selector").hide("fast")}function set_bme_strategy(a){leading_strategy=$("#travel_card_leading_bme_strategy").val();second_strategy=$("#travel_card_second_bme_strategy").val();if(element_to_update_inner_html=="leading_bme_strategy"){if(second_strategy==a){$("#second_bme_strategy").html("");$("#travel_card_second_bme_strategy").val("");second_strategy=""}}if(element_to_update_inner_html=="second_bme_strategy"){if(leading_strategy==a){$("#leading_bme_strategy").html("");$("#travel_card_leading_bme_strategy").val("");leading_strategy=""}}$("#"+element_to_update_inner_html).html(a);if(control_to_update!=""){$("#"+control_to_update).val(a)}autosave("travel_card_leading_bme_strategy",$("#travel_card_leading_bme_strategy").val());autosave("travel_card_second_bme_strategy",$("#travel_card_second_bme_strategy").val());set_third_bme_strategy();element_to_update_inner_html="";control_to_update="";$("#bme_strategy_selector").hide("fast")}function set_third_bme_strategy(){leading_strategy=$("#travel_card_leading_bme_strategy").val();second_strategy=$("#travel_card_second_bme_strategy").val();$("#third_bme_strategy").html("");if(leading_strategy!=""&&second_strategy!=""){remaining_strategy="BME";remaining_strategy=remaining_strategy.replace(leading_strategy,"");remaining_strategy=remaining_strategy.replace(second_strategy,"");if(remaining_strategy.length==1){$("#third_bme_strategy").html(remaining_strategy)}}}function autosave(b,a){$("#transmitting").show();controller="";record_id="";field="";if(b.indexOf("travel_card")>=0){controller="travel_cards";qualified_field="travel_card["+b.replace("travel_card_","")+"]";record_id=$("#travel_card_practice_member_id").val();update_field_to_server(controller,record_id,qualified_field,a);return}}function update_field_to_server(a,c,b,d){field_data=b+"="+d;$.ajax({type:"PUT",url:"/"+a+"/"+c,data:field_data,dataType:"script"})};