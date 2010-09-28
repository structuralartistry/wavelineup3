Feature: User Management

  Scenario: Add a new user to a practice
    Given I am logged in in a "practice user" user role for the practice "Test Practice One"
    Given I am on the home page
    When I follow "Test Practice One"
    Then I should see "Test Practice One"
    And I should see "Users" within "h1"
    And I should see "practice_user@structuralartistry.com"
    And I should see "Manage Practice"
    When I follow "New User"
    Then I should see "Email"
    And I should see "Password"
    And I should see "Password confirmation"
    When I fill in "user_email" with "practice1@structuralartistry.com"
    And I fill in "user_password" with "password1"
    And I fill in "user_password_confirmation" with "password1"
    When I press "Submit"
    Then I should see "Test Practice One"
    And I should see "Users" within "h1"
    And I should see "practice1@structuralartistry.com"
    And I should see "practice user"
    
  Scenario: An existing user can view and update their profile
    Given I am logged in in a "practice user" user role
    When I go to the user profile page
    Then I should see "Email" within "label"
    Then I should see "Password" within "label"
    Then I should see "Password confirmation" within "label"
    And the "user_email" field should contain "practice_user@structuralartistry.com"
    When I fill in "user_email" with "sasha@gmail.com"
    When I press "Submit"
    Then I should see "User profile successfully updated"
    And I should see "Home Page"
    When I go to the user profile page
    Then the "user_email" field should contain "sasha@gmail.com"
    
  Scenario: I can delete a user from my account
    Given I am logged in in a "practice user" user role for the practice "Test Practice One"
    When I follow "Test Practice One"
    When I follow "Destroy" within "tr#practice_user"
    Then I should see "Can not delete the current user"
    When I follow "New User"
    And I fill in "user_email" with "practice1@structuralartistry.com"
    And I fill in "user_password" with "password1"
    And I fill in "user_password_confirmation" with "password1"
    And I press "Submit"
    Then I should see "User was successfully created. Please check your email for the activation link."
    # just destroying any user... there are two, so one should go
    When I follow "Destroy" within "tr#practice1"
    Then I should see "User successfully deleted"
    
    
    
  
