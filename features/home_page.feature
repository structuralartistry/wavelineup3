Feature: Show Home Page
  In order to use Wavelineup
  As a user
  I want to see the home page
  This page will show me the login form if I am not logged in
  And it will show me that I am logged in if I am logged in
  
  
  Scenario: Home page when not logged in
    When I go to the home page
    Then I should see "Login" within "h1"
    And I should see "Create My Practice" within "a"
    And I should not see "Login" within "a"
    And I should not see "Logout"
    And I should not see "Logged in user:"
    And I should not see "Logged in role:"
    
    # should not see form to create a new practice member
    And I should not see "Create new Practice Member"
    And I should not see "First Name"
    And I should not see "Last Name"
    And I should not see "Middle Name"
    
    # should not see practice member list
    And I should not see "Practice Members"
    
    
  Scenario: Home page when logged in in the "sysadmin" role
    Given I am logged in in a "sysadmin" user role
    When I go to the home page
    Then I should see "Home Page" within "h1"
    And I should see "Logout" within "a"
    And I should see "sysadmin_user@structuralartistry.com" within "a"
    And I should see "Logged in user: sysadmin_user@structuralartistry.com" within "p"
    And I should see "Logged in role: sysadmin" within "p"
    And I should not see "Login"
    
    # should not see form to create a new practice member
    And I should not see "Create new Practice Member"
    And I should not see "First Name"
    And I should not see "Last Name"
    And I should not see "Middle Name"
    
    # should not see practice member list
    And I should not see "Practice Members"


  Scenario: Home page when logged in in the "practice admin" role
    Given I am logged in in a "practice admin" user role
    When I go to the home page
    Then I should see "Home Page" within "h1"
    And I should see "Logout" within "a"
    And I should see "practice_admin_user@structuralartistry.com" within "a"
    And I should see "Logged in user: practice_admin_user@structuralartistry.com" within "p"
    And I should see "Logged in role: practice admin" within "p"
    And I should not see "Login"
    
    # should not see form to create a new practice member
    And I should not see "New Practice Member"
    
    # should see practice member list
    And I should not see "Practice Members"
  
  
  Scenario: Home page when logged in in the "practice user" role
    Given I am logged in in a "practice user" user role
    When I go to the home page
    Then I should see "Home Page" within "h1"
    And I should see "Logout" within "a"
    And I should see "practice_user@structuralartistry.com" within "a"
    And I should see "Logged in user: practice_user@structuralartistry.com" within "p"
    And I should see "Logged in role: practice user" within "p"
    And I should not see "Login"
    
    # should see form to create a new practice member
    And I should see "New Practice Member" within "h1"
    And I should see "First Name" within "label"
    And I should see "Last Name" within "label"
    And I should see "Middle Name" within "label"
    
    # should see practice member list
    And I should see "Practice Members" within "h1"