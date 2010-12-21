require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Administration Feature", %q{
  In order to ...
  As a ...
  I want to ...
} do
  
  background do
    create_practice('First Practice')
  end
  
  scenario "Sysadmin role can see practice list" do
    logged_in_as_role(:sysadmin_user)
    visit('/practices')
    assert page.has_content?('First Practice')
  end
  
  scenario "Practice admin role can not see practice list" do
    logged_in_as_role(:practice_admin_user)
    visit('/practices')
    assert page.has_no_content?('First Practice')
    assert page.has_content?('This page is not permitted per your access rights')
  end
  
  scenario "Practice user role can not see practice list" do
    logged_in_as_role(:practice_user)
    visit('/practices')
    assert page.has_no_content?('First Practice')
    assert page.has_content?('This page is not permitted per your access rights')
  end
  
end
