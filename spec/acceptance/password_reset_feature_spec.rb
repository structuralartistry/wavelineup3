require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Password Reset Feature", %q{
  To do...
} do
          
  scenario "A registered user resets their password" do
    user_email = "practice@structuralartistry.com"
    register_and_activate_user(user_email, 'Practice One', :practice_user)
    visit('/login')
    click_selector_cell("Forgot Password?")
    
    assert has_text?('Reset Password', 'h1')
    assert has_text?('Email', 'label')
    assert selector_cell_is_present?('Submit')
    assert selector_cell_is_present?('Cancel')

    fill_in('Email', :with => user_email)
    click_button('Submit')

    assert has_text?('Login', 'h1')
    assert has_text?('Instructions to reset your password have been emailed to you. Please check your email.')

    user = User.find_by_email(user_email)
    visit("/password_resets/#{user.perishable_token}/edit")

    assert has_text?('Reset Password', 'h1')
  
    assert has_text?("User: #{user_email}", 'label')
    assert has_text?('Password', 'label')
    assert has_text?('Password confirmation', 'label')
    
    new_password = 'newPassword1'
    fill_in('Password', :with => new_password)
    fill_in('Password confirmation', :with => new_password)
    click_button('Submit')
          
    assert has_text?('Password successfully updated')
    assert selector_cell_is_present?(user.email)
    
    visit('/logout')
    assert login_as_email_and_password?(user.email, new_password)
    confirm_home_page_loaded
  end
  
end
    
  # 
 # 
 # 
 # Feature: Allow user to reset their password
 #   

 # 
 #     
 #   Scenario: Password reset is attempted on a non-registered email
 #     Given there are no registered practices or users
 #     When I go to the reset password page
 #     And I fill in "user_email" with "practice@structuralartistry.com"
 #     And I press "Submit" within "form#new_user"
 #     Then I should see "No user was found with that email address"
 #     
 #     
 #   Scenario: Logged in user tries to reset their password
 #     Given I am logged in in a "practice user" user role for the practice "Demo Practice"
 #     When I go to the reset password page
 #     Then I should see "Can't reset your password: you are already logged in to the system"
 #     
 #     
 #   Scenario: Start reseting the password and then cancel
 #     Given I am a registered and activated "practice" user with the email "practice@structuralartistry.com"
 #     Given I am not logged in
 #     When I go to the login page
 #     When I press "Forgot Password?"
 #     Then I should see "Reset Password" within "h1"
 #     Then I should see "Please enter your email and press submit." within "p"
 #     And I should see "Email" within "label"
 #     When I press "Cancel"
 #     Then I should see "Login" within "h1"
 