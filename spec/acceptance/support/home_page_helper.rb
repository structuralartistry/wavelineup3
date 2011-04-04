def confirm_home_page_loaded
  assert selector_cell_present?('Logout')
  page.has_content?('My Practice').should == true
  page.has_content?('Systemwide').should == true
  assert selector_cell_present?("New PM")

  has_text?('Invite another Practitioner!', 'p')
  selector_cell_present?('Send!')
  has_text?("Email", 'label')
end
