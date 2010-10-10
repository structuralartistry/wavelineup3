Feature: Log in and log out
  In order to protect secure information
  As an authorized user
  I want to be able to log in to the system
  And I want to be able to log out of the system
  
  
  Scenario: I can get to the login page
    Given I am not logged in
    When I go to the login page
    Then I should see "Login" within "h1"
    Then I should see "Email" within "label"
    And I should see "Password" within "label"
    And I should see "Create My Practice" within a selector cell
    And I should see "Forgot Password?" within a selector cell
    And I should not see "Logout"
    And I should not see "Login" within "td.selector_cell_nav"
    
    
  Scenario: When I am logged in and I go to the login page I am redirected to the home page
    Given I am logged in in a "practice user" user role
    When I go to the login page
    Then I should see "Home Page" within "h1"
    And I should see "Logout" within a selector cell
    
    
  @javascript
  Scenario: When I am logged in and I click the logout link I am sent to the login page
    Given I am logged in in a "practice user" user role
    When I click "Logout" within a selector cell
    Then I should see "Successfully logged out"
    And I should see "Login" within "h1"
    And I should see "Email" within "label"
    And I should see "Password" within "label"
    And I should not see "Logout" within "td.selector_cell_nav"
        
  
  # log in scenarios
  
    Scenario: Authentication succeeds when good information provided
      Given there are no registered practices or users
      Given I am on the login page
      Given I am a registered and activated user with the email "practice@structuralartistry.com"
      When I fill in "user_session_email" with "practice@structuralartistry.com"
      And I fill in "user_session_password" with "password1"
      When I press "Submit"
      Then I should see "practice@structuralartistry.com" within a selector cell
  
  
    Scenario: Authentication fails when no login info
      Given I am not logged in
      Given I am on the login page
      When I press "Submit"
      Then I should see "Authentication failed"
    
    
    Scenario: Authentication fails when no email
      Given I am not logged in
      Given I am on the login page
      When I press "Submit"
      Then I should see "Authentication failed"
    
    
    Scenario: Authentication fails when no password
      Given I am not logged in
      Given I am on the login page
      When I press "Submit"
      Then I should see "Authentication failed"
  
  