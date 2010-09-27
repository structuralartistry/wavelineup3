Feature: Show Home Page
  In order to use Wavelineup
  As a user
  I want to see the home page
  This page will show me the login form if I am not logged in
  And it will show me that I am logged in if I am logged in
  
  Scenario: Home Page when not logged in
    When I go to the home page
    Then I should see "Login" within "h1"
    And I should see "Create My Practice" within "a"
    And I should not see "Login" within "a"
    And I should not see "Logout"
    And I should not see "Logged in user:"
    And I should not see "Logged in role:"
    
  Scenario: Home Page when logged in as a sysadmin user
    Given I am logged in in a "sysadmin" user role
    When I go to the home page
    Then I should see "Home Page" within "h1"
    And I should see "Logout" within "a"
    And I should see "sysadmin@structuralartistry.com" within "a"
    And I should see "Logged in user: sysadmin@structuralartistry.com" within "p"
    And I should see "Logged in role: sysadmin" within "p"
    And I should not see "Login"
    
  Scenario: Home Page when logged in as a practice user
    Given I am logged in in a "practice user" user role
    When I go to the home page
    Then I should see "Home Page" within "h1"
    And I should see "Logout" within "a"
    And I should see "practice_user@structuralartistry.com" within "a"
    And I should see "Logged in user: practice_user@structuralartistry.com" within "p"
    And I should see "Logged in role: practice" within "p"
    And I should not see "Login"