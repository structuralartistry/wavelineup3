Feature: Administer system

  Scenario: A "sysadmin" role can see the practice list
    Given there is a practice in the system named "Demo Practice"
    Given I am logged in in a "sysadmin" user role
    When I go to the practices page
    Then I should see "Demo Practice"
    
    
  Scenario: A "practice admin" role can not see the practice list
    Given there is a practice in the system named "Demo Practice"
    Given I am logged in in a "practice admin" user role
    When I go to the practices page
    Then I should see "This page is not permitted per your access rights"
    
    
  Scenario: A "practice user" role can not see the practice list
    Given there is a practice in the system named "Demo Practice"
    Given I am logged in in a "practice user" user role
    When I go to the practices page
    Then I should see "This page is not permitted per your access rights"
    