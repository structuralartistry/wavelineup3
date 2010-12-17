require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Practice Registration Feature", %q{
  A new chiropractic practice can sign up for an account.
  When setting up a new account a primary user is set up in the process.
  The new user must activate their user via their email so we are assured to have a good email address for every user.
} do
  
  scenario "Register a new Practice and activate in system" do
    Factory.create(:practice_admin_user)
    
    visit('/login')
    click_selector_cell('Create My Practice')
    assert has_text?('Create Practice', 'h1')
    assert has_text?('Practice name', 'label')
    assert has_text?('Create your login')
    assert has_text?('You will be able to create more users for your practice once your registration is complete.')
    assert has_text?('Email', 'label')
    assert has_text?('Password', 'label')
    assert has_text?('Password confirmation', 'label')
    assert has_text?('Cancel', 'a')
    
    fill_in('Practice name', :with => 'Practice One')
    fill_in('Email', :with => 'practice@structuralartistry.com')
    fill_in('Password', :with => 'password1')
    fill_in('Password confirmation', :with => 'password1')
    click_button('Submit')
    
    assert has_text?('Practice was successfully created. Please check your email for the activation link.')
  end
  
end



#     When I fill in "practice_name" with "Practice One"
#     And I fill in "practice_users_attributes_0_email" with "practice@structuralartistry.com"
#     And I fill in "practice_users_attributes_0_password" with "password1"
#     And I fill in "practice_users_attributes_0_password_confirmation" with "password1"
#     When I press "Submit"
#     Then I should see "Practice was successfully created. Please check your email for the activation link."
#     
#     # activate primary user for the new practice
#     Given I check my email "practice@structuralartistry.com" and activate my user
#     
#     # verify success
#     Then I should see "Practice One" within a selector cell
#     And I should see "practice@structuralartistry.com" within a selector cell
#     When I click "Practice One" within a selector cell
#     Then I should see "Manage Practice"
#     And I should see "practice@structuralartistry.com" within "td"
#     And I should not see "Email" within "label"
#     And I should not see "Password" within "label"
#     And I should not see "Password confirmation" within "label"
#     
#     
#   Scenario: A practitioner tries to register a practice with a name which already exists
#     Given there is a practice in the system named "Practice One"
#     Given I am not logged in
#     When I go to the new practice page
#     When I fill in "practice_name" with "Practice One"
#     And I fill in "practice_users_attributes_0_email" with "practice@structuralartistry.com"
#     And I fill in "practice_users_attributes_0_password" with "password1"
#     And I fill in "practice_users_attributes_0_password_confirmation" with "password1"
#     When I press "Submit"
#     Then I should see "Practice name has already been taken"
#     
