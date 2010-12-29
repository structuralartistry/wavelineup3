def confirm_travel_card_loaded
  has_text?('DO', 'td').should==true
  has_text?('LOC', 'td').should==true
  has_text?('Rsp Wv', 'td').should==true
end

def confirm_visit_loaded
  page.has_content?('visit list for').should == true
  # mini tc
  has_text?('LC', 'td')
  has_text?('RW', 'td')
  # visit
  has_text?('PH', 'td')
  has_text?('GW1', 'td')
  has_text?('GW2', 'td')
  has_text?('Dir', 'td')
  has_text?('LLA', 'td')
  has_text?('SLA', 'td')
  has_text?('Notes', 'td')
  has_text?('Diagnosis', 'td')
end

def confirm_visit_list_loaded
  page.has_content?('visit list for').should == true
end

def confirm_practice_room_selector_loaded
  selector_cell_present?('V').should == true
  selector_cell_present?('TC').should == true
  selector_cell_present?('VL').should == true 
end
