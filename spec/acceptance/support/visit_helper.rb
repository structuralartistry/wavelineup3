def verify_highlighted?(id)
  page.has_xpath?("//*[@id='#{id}' and contains(concat(' ',normalize-space(@class),' '),' highlighted ')]")
end

def verify_visit_loaded(visit_id)
  expected_visit = Visit.find(visit_id)
  
  get_element_text('visit_entrainment_date').to_date.should == expected_visit.entrainment_date
  get_selector_cell_text('selected_phase_1').should == expected_visit.phase_1
  get_selector_cell_text('selected_phase_2').should == expected_visit.phase_2
end


