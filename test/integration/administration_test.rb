require 'test_helper'

class AdministrationTest < ActionDispatch::IntegrationTest
  
  def setup
    DatabaseCleaner.clean
    create_practice('First Practice') 
    Capybara.current_driver = :rack_test
  end
  
  def teardown
    log_out
  end
  
  def test_sysadmin_role_can_see_practice_list
    logged_in_as_role(:sysadmin_user)
    visit('/practices')
    assert page.has_content?('First Practice')
  end
  
  def test_pracitce_admin_role_can_not_see_practice_list
    logged_in_as_role(:practice_admin_user)
    visit('/practices')
    assert page.has_no_content?('First Practice')
    assert page.has_content?('This page is not permitted per your access rights')
  end
  
  def test_practice_user_role_can_not_see_practice_list
    Capybara.current_driver = :selenium
    logged_in_as_role(:practice_user)
    visit('/practices')
    assert page.has_no_content?('First Practice')
    assert page.has_content?('This page is not permitted per your access rights')
  end
  
  def test_sysadmin_role_can_see_practice_list1
    logged_in_as_role(:sysadmin_user)
    visit('/practices')
    assert page.has_content?('First Practice')
  end
  
  def test_pracitce_admin_role_can_not_see_practice_list2
    logged_in_as_role(:practice_admin_user)
    visit('/practices')
    assert page.has_no_content?('First Practice')
    assert page.has_content?('This page is not permitted per your access rights')
  end

end