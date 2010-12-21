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
  
  scenario "Send an invitation to another Practitioner", :js => true do
    practice_name = 'SA Practice'
    logged_in_as_role_for_practice(:practice_user, practice_name)
    create_practice_member("Kahn, David N", practice_name)
    visit('/home')
    invitee_email = 'practitioner@gmail.com'
    fill_in('Email', :with => invitee_email)
    click_selector_cell('Send!')
    
    has_text?("An invite has been sent to #{invitee_email}", 'p')
    selector_cell_present?('New Practice Member').should == true # page gets reinitialized to reset the form and the send button as a selector cell, so make sure these are present
    selector_cell_present?('Find').should == true
    selector_cell_present?('Feedback/Support').should == true
  end

end