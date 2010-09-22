Feature: User registration

  Scenario: A new user can register and then successfully log in to the system
    Given there are no registered users
    When I go to the register page
    Then I should see "Email" within "label"
    Then I should see "Password" within "label"
    Then I should see "Password confirmation" within "label"
    
  Scenario: A new user is created when the form is successfully filled out
    Given there are no registered users
    Given I am on the register page    
    When I fill in "user_email" with "dk@structuralartistry.com"
    When I fill in "user_password" with "password1"
    When I fill in "user_password_confirmation" with "password1"
    When I press "Submit"
    Then I should see "Registration successful"
  
  Scenario: An existing user can view and update their profile
    Given I am logged in as a practice user
    When I go to the user profile page
    Then I should see "Email" within "label"
    Then I should see "Password" within "label"
    Then I should see "Password confirmation" within "label"
    And the "user_email" field should contain "practice@structuralartistry.com"
    When I fill in "user_email" with "sasha@gmail.com"
    When I press "Submit"
    Then I should see "User profile successfully updated"
    And I should see "Home Page"
    When I go to the user profile page
    Then the "user_email" field should contain "sasha@gmail.com"
    