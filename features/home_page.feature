Feature: Show Home Page
  In order to use Wavelineup
  As a user
  I want to see the home page
  This page will show me the login form if I am not logged in
  And it will show me that I am logged in if I am logged in
  
  Scenario: Home page when not logged in
    # should redirect to login page
    When I go to the home page
		Then I should be on the login page
		And I should see the login fields
    # should not see button to create a new practice member
    And I should not see "New Practice Member" within a selector cell

    
  @javascript
  Scenario: Home page when logged in in the "sysadmin" role
    Given I am logged in in a "sysadmin" user role
    When I go to the home page
    And I should see "Home" within a selector cell
    And I should see "Logout" within a selector cell
    And I should see "sysadmin_user@structuralartistry.com" within a selector cell
    And I should not see "Login"
    
    And I should not see "New Practice Member" within a selector cell
    
 
  @javascript
  Scenario: Home page when logged in in the "practice admin" role
    Given I am logged in in a "practice admin" user role for the practice "Demo Practice"
    When I go to the home page
    And I should see "Home" within a selector cell
    And I should see "Logout" within a selector cell
    And I should see "practice_admin_user@structuralartistry.com" within a selector cell
    And I should not see "Login"
    
    And I should see "New Practice Member" within a selector cell
    
    # should not see find button as no practice members
    And I should not see "Find" within a selector cell  
  
  @javascript
  Scenario: Home page when logged in in the "practice user" role
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    When I go to the home page
    And I should see "Home" within a selector cell
    And I should see "Logout" within a selector cell
    And I should see "practice_user@structuralartistry.com" within a selector cell
    And I should not see "Login"
    
    And I should see "New Practice Member" within a selector cell
    
    # should not see find button as no practice members
    And I should not see "Find" within a selector cell