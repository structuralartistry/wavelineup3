Feature: Show Home Page
  In order to use Wavelineup
  As a user
  I want to see the home page
  This page will show me the login form if I am not logged in
  And it will show me that I am logged in if I am logged in
  
  Scenario: Home page when not logged in
    When I go to the home page
    Then I should see "Login" within "h1"
    And I should see "Create My Practice" within a selector cell
    And I should not see "Home" within "td.selector_cell_nav"
    And I should not see "Login" within "td.selector_cell_nav"
    And I should not see "Logout"
    
    # should not see form to create a new practice member
    And I should not see "Create new Practice Member"
    And I should not see "First Name"
    And I should not see "Last Name"
    And I should not see "Middle Name"
    
    # should not see practice member list
    And I should not see "Practice Members"
    
  @javascript
  Scenario: Home page when logged in in the "sysadmin" role
    Given I am logged in in a "sysadmin" user role
    When I go to the home page
    Then I should see "Home Page" within "h1"
    And I should see "Home" within a selector cell
    And I should see "Logout" within a selector cell
    And I should see "sysadmin_user@structuralartistry.com" within a selector cell
    And I should not see "Login"
    And I should not see "New Practice Member" within a selector cell
    
    # should not see practice member list
    And I should not see "Practice Members"

  @javascript
  Scenario: Home page when logged in in the "practice admin" role
    Given I am logged in in a "practice admin" user role for the practice "Demo Practice"
    When I go to the home page
    Then I should see "Home Page" within "h1"
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
    Then I should see "Home Page" within "h1"
    And I should see "Home" within a selector cell
    And I should see "Logout" within a selector cell
    And I should see "practice_user@structuralartistry.com" within a selector cell
    And I should not see "Login"
    
    And I should see "New Practice Member" within a selector cell
    
    # should not see find button as no practice members
    And I should not see "Find" within a selector cell