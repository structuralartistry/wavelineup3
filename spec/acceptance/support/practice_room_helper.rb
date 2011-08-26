def confirm_travel_card_view_showing
  has_text?('DO', 'td').should==true
  has_text?('LOC', 'td').should==true
  has_text?('Rsp Wv', 'td').should==true
end

def confirm_visit_view_showing
  # just verifying that the view is showing...
  return if selector_cell_present?('New Visit')

  # mini tc
  has_text?('LC', 'td').should eq(true)
  has_text?('RW', 'td').should eq(true)
  # visit
  has_text?('PH', 'td').should eq(true)
  has_text?('GW 1', 'td').should eq(true)
  has_text?('GW 2', 'td').should eq(true)
  has_text?('Dir', 'td').should eq(true)
  has_text?('LLA', 'td').should eq(true)
  has_text?('SLA', 'td').should eq(true)
  has_text?('Notes', 'td').should eq(true)
  has_text?('Diagnosis', 'td').should eq(true)
end

def confirm_visit_list_view_showing
  page.has_content?('No Visits on record for this Practice Member').should == true
end

def confirm_practice_room_selector_loaded
  selector_cell_present?('Visit').should == true
  selector_cell_present?('Travel Card').should == true
  selector_cell_present?('Visit List').should == true
end
