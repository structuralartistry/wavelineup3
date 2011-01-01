def travel_card_gateway_fields
  travel_card_fields = %w(
    dominant_occiput
    gateway_occ_c1
    gateway_c1_occ
    gateway_c1_c2
    gateway_c2_c1
    gateway_c2_c3
    gateway_c3_c2
    gateway_c3_c4
    gateway_c4_c3
    gateway_c4_c5
    gateway_c5_c4
    gateway_c5_c6
    gateway_c6_c5
    gateway_c6_c7
    gateway_c7_c6
    gateway_c7_t1
    gateway_t1_c7
    gateway_t1_t2
    gateway_t2_t1
    gateway_t2_t3
    gateway_t3_t2
    gateway_s1
    gateway_s2
    gateway_s3
    gateway_s4
    gateway_s5
    gateway_cx)  
end

def set_travel_card_default_values(travel_card)
  # set default travel card values
  travel_card.level_of_care = '1A'
  travel_card.full_respiratory_wave = 'X'
  travel_card.leading_bme_strategy = 'B'
  travel_card.second_bme_strategy = 'M'
    
  #set travel card lr fields to 'L'
  travel_card_gateway_fields.each do |field|
    eval("travel_card.#{field}='L'")
  end
  travel_card.save
end

def mini_or_travel_card_gateway_cell_correct?(id, side_text)
  if side_text != ''
    return true if page.find(:xpath, "//td[@id='#{id}' and contains(concat(' ',normalize-space(@class),' '),' #{side_text} ')]").text == side_text
  else
    return true if page.find(:xpath, "//td[@id='#{id}']").text == side_text
  end 
  false
end

def mini_or_travel_card_non_gateway_cell_correct?(id, expected_text)
  return page.find(:xpath, "//td[@id='#{id}']").text == expected_text
end