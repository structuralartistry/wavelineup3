Feature: Administer system

  Scenario: As system admin I should be able to see the practice list
    Given there is a practice in the system named "Demo Practice"
    Given I am logged in in a "sysadmin" user role
    When I go to the practices page
    Then I should see "Demo Practice"
    
  Scenario: Practice admin can not see the practice list
    Given there is a practice in the system named "Demo Practice"
    Given I am logged in in a "practice admin" user role
    When I go to the practices page
    Then I should see "Page not permitted per your user role"  
    
  Scenario: Practice user can not see the practice list
    Given there is a practice in the system named "Demo Practice"
    Given I am logged in in a "practice user" user role
    When I go to the practices page
    Then I should see "Page not permitted per your user role"
    