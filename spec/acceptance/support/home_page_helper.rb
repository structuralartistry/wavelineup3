def confirm_home_page_loaded
  assert selector_cell_is_present?('Logout')
  assert page.has_content?("a community driven system")
  assert selector_cell_is_present?("New Practice Member")
  
  has_text?('Invite another Practitioner!', 'p')
  selector_cell_is_present?('Send!')
  has_text?('Email address', 'label')
end
