Feature: Allow user to reset their password
  
  @javascript
  Scenario: A registered user resets their password
    Given I am a registered and activated user with the email "practice@structuralartistry.com"
    Given I am not logged in
    When I go to the login page
    
    # retrieve password
    When I press "Forgot Password?"
    Then I should see "Reset Password" within "h1"
    Then I should see "Please enter your email and press submit." within "p"
    And I should see "Email" within "label"
    Then I fill in "user_email" with "practice@structuralartistry.com"
    When I press "Submit"
    And I should see "Login" within "h1"
    And I should see "Instructions to reset your password have been emailed to you. Please check your email."
    Given I check my email for practice@structuralartistry.com and follow the password reset link
    
    # change password
    Then I should see "Reset Password" within "h1"
    And I should see "User: practice@structuralartistry.com" within "label"
    And I should see "Password" within "label"
    And I should see "Password confirmation" within "label"
    Then I fill in "Password" with "newpassword1"
    And I fill in "Password confirmation" with "newpassword1"
    When I press "Submit"
    
    # confirmation
    Then I should see "Password successfully updated"
    And I should see "practice@structuralartistry.com" within a selector cell
    
    # validate new password is good
    When I click "Logout" within a selector cell
    Then I fill in "Email" with "practice@structuralartistry.com"
    And I fill in "Password" with "newpassword1"
    When I press "Submit"
    Then I should see "practice@structuralartistry.com"

    
  Scenario: Password reset is attempted on a non-registered email
    Given there are no registered practices or users
    When I go to the reset password page
    And I fill in "user_email" with "practice@structuralartistry.com"
    And I press "Submit" within "form#new_user"
    Then I should see "No user was found with that email address"
    
    
  Scenario: Logged in user tries to reset their password
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    When I go to the reset password page
    Then I should see "Can't reset your password: you are already logged in to the system"
    
    
  Scenario: Start reseting the password and then cancel
    Given I am a registered and activated user with the email "practice@structuralartistry.com"
    Given I am not logged in
    When I go to the login page
    When I press "Forgot Password?"
    Then I should see "Reset Password" within "h1"
    Then I should see "Please enter your email and press submit." within "p"
    And I should see "Email" within "label"
    When I press "Cancel"
    Then I should see "Login" within "h1"
    