def verify_highlighted?(id)
  page.has_xpath?("//*[@id='#{id}' and contains(concat(' ',normalize-space(@class),' '),' highlighted ')]")
end

def mini_travel_card_gateway_cell_correct?(id, side_text)
  if side_text != ''
    return true if page.find(:xpath, "//td[@id='#{id}' and contains(concat(' ',normalize-space(@class),' '),' #{side_text} ')]").text == side_text
  else
    return true if page.find(:xpath, "//td[@id='#{id}']").text == side_text
  end 
  false
end

def mini_travel_card_non_gateway_cell_correct?(id, expected_text)
  return page.find(:xpath, "//td[@id='#{id}']").text == expected_text
end
