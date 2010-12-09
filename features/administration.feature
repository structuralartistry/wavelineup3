Feature: Administer system

  Background:
    Given there is a practice in the system named "Demo Practice"

  Scenario: A "sysadmin" role can see the practice list
    Given I am logged in in a "sysadmin" user role
    When I go to the practices page
    Then I should see "Demo Practice"
    
    
  Scenario: A "practice admin" role can not administer practices
    Given I am logged in in a "practice admin" user role for the practice "Demo Practice"
    When I go to the practices page
    Then I should see "This page is not permitted per your access rights"
    
    
  Scenario: A "practice user" role can not administer practices
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    When I go to the practices page
    Then I should see "This page is not permitted per your access rights"
    