def confirm_travel_card_loaded
  has_text?('DO', 'td').should==true
  has_text?('LOC', 'td').should==true
  has_text?('Rsp Wv', 'td').should==true
end

def confirm_visit_loaded
  page.has_content?('visit for').should == true
end

def confirm_visit_list_loaded
  page.has_content?('visit list for').should == true
end
