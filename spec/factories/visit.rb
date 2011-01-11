Factory.define :visit do |v|
  # v.association :practice_member, :factory => :practice_member
  v.practice_member_id 1
  v.entrainment_date '2010-12-31'
  v.phase_1 '1 > 3'
  v.phase_1_gateway_1 'OCC'
  v.phase_1_gateway_2 'S1'
  v.phase_1_gateway_1_affecting 'S1'
  v.phase_1_gateway_2_affecting 'S2'
  v.phase_1_level_of_care '1A'
  v.phase_1_direction 'M'
  v.phase_2 '1 > 2 C1'
  v.phase_2_gateway_1 'OCC'
  v.phase_2_gateway_2 'S1'
  v.phase_2_gateway_1_affecting 'C1/OCC'
  v.phase_2_gateway_2_affecting 'C1/C2'
  v.phase_2_level_of_care '1A'
  v.phase_2_direction 'F/E'
  v.sri_stage '1'
  v.sri_position_a '1'
  v.sri_position_b '1'
  v.sri_level_of_care '1A'
  v.sri_organizing_field 'H1'
  v.short_leg_side 'L'
  v.short_leg_amount '0-0.5'
  v.heel_tension_level '1'
  v.eversion_tension_level '1'
  v.abduction_tension_level '1'
  v.adduction_tension_level '1'
  v.ingression_organizing_field 'H1'
  v.egression_organizing_field 'H1'
  v.long_lever_arm 'X'
  v.short_lever_arm 'X'
  v.crest 'X'
  v.diagnosis 'I diagnose no diagnosis'
  v.notes 'I note no notes'
end