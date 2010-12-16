require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

def confirm_login_page_loaded
  # verify fields
  assert page.has_xpath?("//h1[text()='Login']")
  assert page.has_xpath?("//label[text()='Email']")
  assert page.has_xpath?("//label[text()='Password']") 
  assert selector_cell_is_present?("Create My Practice")
  assert page.has_no_content?("Logout")

  assert page.has_no_xpath?("//td[(@class='selector_cell_nav') and (text()='Login')]")
end

def confirm_home_page_loaded
  assert page.has_content?("Logout")
  assert page.has_content?("a community driven system")
  assert selector_cell_is_present?("New Practice Member")
end

feature "Authentication Feature", %q{
  In order to ...
  As a ...
  I want to ...
} do
    
  scenario "be albe to log in and log out", :js => true do
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

  scenario "not be able to access system with missing or incomplete login info" do
    log_in_as_email_and_password?("","")
    confirm_login_page_loaded
    assert page.has_content?("Authentication failed")
  
    practice = create_practice("Someones Practice")

    # good email only
    log_in_as_email_and_password?(practice.users[0].email,"")
    confirm_login_page_loaded
    assert page.has_content?("Authentication failed")
  
    # good password only
    log_in_as_email_and_password?("", 'password1')
    confirm_login_page_loaded
    assert page.has_content?("Authentication failed")
  
    # success
    log_in_as_email_and_password?(practice.users[0].email, 'password1')
    confirm_home_page_loaded
  end
  
end
