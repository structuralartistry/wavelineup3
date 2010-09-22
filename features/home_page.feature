Feature: Show Home Page
  In order to use Wavelineup
  As a user
  I want to see the home page
  This page will show me the login form if I am not logged in
  And it will show me that I am logged in if I am logged in
  
  Scenario: Home Page when not logged in
    When I go to the home page
    Then I should see "Home Page" within "h1"
    And I should see "Login" within "a"
    And I should see "Register" within "a"
    And I should not see "Logout"
    And I should not see "Logged in user:"
    
  Scenario: Home Page when logged in as a sysadmin user
    Given I am logged in as a sysadmin user
    When I go to the home page
    Then I should see "Home Page" within "h1"
    And I should see "Logout" within "a"
    And I should see "Edit Profile" within "a"
    And I should see "Logged in user: sysadmin" within "p"
    And I should see "Logged in role: sysadmin" within "p"
    And I should not see "Login"
    
  Scenario: Home Page when logged in as a practice user
    Given I am logged in as a practice user
    When I go to the home page
    Then I should see "Home Page" within "h1"
    And I should see "Logout" within "a"
    And I should see "Edit Profile" within "a"
    And I should see "Logged in user: practice" within "p"
    And I should see "Logged in role: practice" within "p"
    And I should not see "Login"