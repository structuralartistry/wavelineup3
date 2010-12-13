require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  
  def setup
    DatabaseCleaner.clean
  end
  
  def confirm_login_page_loaded
    # verify fields
    assert page.has_xpath?("//h1[text()='Login']")
    assert page.has_xpath?("//label[text()='Email']")
    assert page.has_xpath?("//label[text()='Password']") 
    assert selector_cell_is_present?("Create My Practice")
    assert page.has_no_content?("Logout")
debugger
    assert page.has_no_xpath?("//td[(@class='selector_cell_nav') and (text()='Login')]")
  end
  
  def confirm_home_page_loaded
    assert page.has_content?("Logout")
    assert page.has_content?("a community driven system")
    assert selector_cell_is_present?("New Practice Member")
  end
  
  test "log in and log out" do
    visit('login')
    
    confirm_login_page_loaded
    
    # login with good user
    logged_in_as_role_for_practice(:practice_user, "My Practice")
    confirm_home_page_loaded

    # try to go to login and should redirect to home
    visit('login')
    confirm_home_page_loaded
    
    # logout
    click_selector_cell("Logout")
    confirm_login_page_loaded
    
    # try to go to home page, should redirect to login
    visit('home')
    confirm_login_page_loaded
  end
  
  test "login fails with no or incomplete login info provided" do
    log_in_as_email_and_password?("","")
    confirm_login_page_loaded
    assert page.has_content?("Authentication failed")
    
    practice = create_practice("Someones Practice")
 
    # good email only
    log_in_as_email_and_password?(practice.users[0].email,"")
    confirm_login_page_loaded
    assert page.has_content?("Authentication failed")
    
    # good password only
    log_in_as_email_and_password?("", TEST_PASSWORD)
    confirm_login_page_loaded
    assert page.has_content?("Authentication failed")
    
    # success
    log_in_as_email_and_password?(practice.users[0].email, TEST_PASSWORD)
    confirm_home_page_loaded
  end
  


  #   # log in scenarios
  #     Scenario: Authentication succeeds when good information provided
  #       Given there are no registered practices or users
  #       Given I am on the login page
  #       Given I am a registered and activated "practice" user with the email "practice@structuralartistry.com"
  #       When I login with email "practice@structuralartistry.com" and password "password1"
  #       Then I should see "practice@structuralartistry.com" within a selector cell
  # 
  # 
  #     Scenario: Authentication fails when no login info
  #       Given I am not logged in
  #       Given I am on the login page
  #       When I press "Submit"
  #       Then I should see "Authentication failed"
  # 
  # 
  #     Scenario: Authentication fails when no email
  #       Given I am not logged in
  #       Given I am on the login page
  #       When I press "Submit"
  #       Then I should see "Authentication failed"
  # 
  # 
  #     Scenario: Authentication fails when no password
  #       Given I am not logged in
  #       Given I am on the login page
  #       When I press "Submit"
  #       Then I should see "Authentication failed"

  
  


end