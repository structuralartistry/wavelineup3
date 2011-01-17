def verify_highlighted?(id)
  page.has_xpath?("//*[@id='#{id}' and contains(concat(' ',normalize-space(@class),' '),' highlighted ')]")
end

def verify_visit_loaded(visit_id)
  expected_visit = Visit.find(visit_id)
  
  visit_date_on_page = get_element_text('visit_date').to_datetime
  visit_date_on_page.year.should == expected_visit.date.year
  visit_date_on_page.month.should == expected_visit.date.month
  visit_date_on_page.day.should == expected_visit.date.day
  visit_date_on_page.hour.should == expected_visit.date.hour
  visit_date_on_page.min.should == expected_visit.date.min
  
  get_selector_cell_text('selected_phase_1').should == (expected_visit.phase_1 || '')
  get_selector_cell_text('selected_phase_2').should == (expected_visit.phase_2 || '')
end


