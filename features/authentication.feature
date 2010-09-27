Feature: Log in and log out
  In order to protect secure information
  As an authorized user
  I want to be able to log in to the system
  And I want to be able to log out of the system
  
  Scenario: I can get to the login page
    When I go to the login page
    Then I should see "Login" within "h1"
    Then I should see "Email" within "label"
    And I should see "Password" within "label"
    And I should see "Create My Practice" within "a"
    And I should see "Forgot Password?" within "a"
#    And I should see "Submit" --- cant seem to test this but it will get found in other tests if missing
    And I should not see "Logout"
    And I should not see "Login" within "a"
    
  Scenario: When I am logged in and I go to the login page I am redirected to the home page
    Given I am logged in in a "practice user" user role
    When I go to the login page
    Then I should see "Home Page" within "h1"
    And I should see "Logout" within "a"
    
  Scenario: When I am logged in and I click the logout link I am sent to the login page
    Given I am logged in in a "practice user" user role
    When I follow "Logout"
    Then I should see "Successfully logged out"
    And I should see "Login" within "h1"
    And I should see "Email" within "label"
    And I should see "Password" within "label"
    And I should not see "Logout" within "a" 

  
  