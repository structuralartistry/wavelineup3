require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Home Page Feature", %q{
  In order to use Wavelineup
  As a user
  I want to see the home page
  This page will show me the login form if I am not logged in
  And it will show me that I am logged in if I am logged in
} do
    
  context "access rights and basic page load" do
    
    scenario "Home page when not logged in" do
      visit('/home')
      confirm_login_page_loaded
    end
  
    scenario "Home page logged in as sysadmin" do
      logged_in_as_role(:sysadmin_user)
      visit('/home')
      confirm_home_page_loaded
    end
  
    scenario "Home page logged in as a practice admin user" do
      logged_in_as_role(:practice_admin_user)
      visit('/home')
      confirm_home_page_loaded
    end
  
    scenario "Home page logged in as a practice user" do
      logged_in_as_role(:practice_user)
      visit('/home')
      confirm_home_page_loaded
    end
    
    scenario "There is a form on the home page to send an invitation to a new practice/user" do
      logged_in_as_role(:practice_user)
      visit('/home')
    end
    
  end
  
  scenario "Send an invitation to another Practitioner" do
    logged_in_as_role(:practice_user)
    visit('/home')
    invitee_email = 'practitioner@gmail.com'
    fill_in('Email address', :with => invitee_email)
    click_selector_cell('Send Invite!')
    
    has_text?("Your invitation has been sent to #{invitee_email}")
  end

end