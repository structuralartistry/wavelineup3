require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Authentication Feature", %q{
  In order to ...
  As a ...
  I want to ...
} do
      
  context "basic access and restriction" do
    
    scenario "be albe to log in and log out" do
      visit('/login') 
      confirm_login_page_loaded
  
      # login with good user
      logged_in_as_role_for_practice(:practice_user, "My Practice")
      confirm_home_page_loaded

      # logout
      click_selector_cell("Logout")
      confirm_login_page_loaded
  
      # try to go to home page, should redirect to login
      visit('/home')
      confirm_login_page_loaded
    end
    
    scenario "login page redirects to home if user logged in" do
      logged_in_as_role_for_practice(:practice_user, "My Practice")
      visit('/login')      
      confirm_home_page_loaded
    end

    scenario "not be able to access system with missing or incomplete login info" do
      login_as_email_and_password?("","")
      confirm_login_page_loaded
      assert page.has_content?("Authentication failed")
  
      practice = create_practice("Someones Practice")

      # good email only
      login_as_email_and_password?(practice.users[0].email,"")
      confirm_login_page_loaded
      assert page.has_content?("Authentication failed")
  
      # good password only
      login_as_email_and_password?("", 'Password1')
      confirm_login_page_loaded
      assert page.has_content?("Authentication failed")
  
      # success
      login_as_email_and_password?(practice.users[0].email, 'Password1')
      confirm_home_page_loaded
    end
    
  end
  
end
