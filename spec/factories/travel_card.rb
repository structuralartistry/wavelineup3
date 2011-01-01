Factory.define :travel_card do |tc|
  tc.association :practice_member, :factory => :practice_member
  tc.dominant_occiput 'L'
  tc.level_of_care '1A'
  tc.full_respiratory_wave 'X'
  tc.leading_bme_strategy 'B'
  tc.second_bme_strategy 'M'
  tc.gateway_occ_c1 'L'
  tc.gateway_c1_occ 'L'
  tc.gateway_c1_c2 'L'
  tc.gateway_c2_c1 'L'
  tc.gateway_c2_c3 'L'
  tc.gateway_c3_c2 'L'
  tc.gateway_c3_c4 'L'
  tc.gateway_c4_c3 'L'
  tc.gateway_c4_c5 'L'
  tc.gateway_c5_c4 'L'
  tc.gateway_c5_c6 'L'
  tc.gateway_c6_c5 'L'
  tc.gateway_c6_c7 'L'
  tc.gateway_c7_c6 'L'
  tc.gateway_c7_t1 'L'
  tc.gateway_t1_c7 'L'
  tc.gateway_t1_t2 'L'
  tc.gateway_t2_t1 'L'
  tc.gateway_t2_t3 'L'
  tc.gateway_t3_t2 'L'
  tc.gateway_s1 'L'
  tc.gateway_s2 'L'
  tc.gateway_s3 'L'
  tc.gateway_s4 'L'
  tc.gateway_s5 'L'
  tc.gateway_cx 'L'
  tc.passive_c1_c7_tension_level '1'
  tc.passive_t1_t12_tension_level '1'
  tc.passive_l1_l5_tension_level '1'
  tc.passive_s1_cx_tension_level '1'
  tc.active_c1_c7_tension_level '1'
  tc.active_t1_t12_tension_level '1'
  tc.active_l1_l5_tension_level '1'
  tc.active_s1_cx_tension_level '1'
  tc.sri_position_1_level_of_awareness '1'
  tc.sri_position_2_level_of_awareness '1'
  tc.sri_position_3_level_of_awareness '1'
  tc.sri_safety_position '1'
  tc.buzz_words_for_sri 'Give me my mommy!'
  tc.book_12_stages 'X'
  tc.book_healing_magic 'X'
  tc.number_gate '1'
  tc.number_hip '1'
  tc.number_ultima '1'
  tc.number_ultimatum '1'
  tc.number_sri '1'
  tc.notes 'My notes are here'
end