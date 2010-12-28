def confirm_home_page_loaded
  assert selector_cell_present?('Logout')
  assert page.has_content?("a community driven system")
  assert selector_cell_present?("New PM")
  
  has_text?('Invite another Practitioner!', 'p')
  selector_cell_present?('Send!')
  has_text?("Email", 'label')
end
