def confirm_login_page_loaded
  # verify fields
  assert page.has_xpath?("//h1[text()='Login']")
  assert page.has_xpath?("//label[text()='Email']")
  assert page.has_xpath?("//label[text()='Password']") 
  assert selector_cell_is_present?("Create My Practice")
  assert !selector_cell_is_present?('Logout')

  assert page.has_no_xpath?("//td[(@class='selector_cell_nav') and (text()='Login')]")
end