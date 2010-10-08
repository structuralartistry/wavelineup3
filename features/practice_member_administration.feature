Feature: Practice member administration

  Background:
    Given I am logged in in a "practice admin" user role for the practice "Hello Kitty Practice"

  Scenario: As a practice user I want to add a new Practice Member to the system
    Given I am on the home page
    When I fill in "practice_member_name_last" with "Kahn" within "form#new_practice_member"
    And I fill in "practice_member_name_first" with "David" within "form#new_practice_member"
    And I fill in "practice_member_name_middle" with "N" within "form#new_practice_member"
    And I press "Submit"
    Then I should see "Practice Member successfully created"
    And I should see "Kahn" within "td"
    And I should see "David" within "td"
    And I should see "N" within "td"
    
  Scenario: As a practice user I want to modify an existing Practice Member in the system
    Given there is a Practice Member in my practice named "Hello Kitty Practice" by the name of "Kahn, David N"
    Given I am on the home page
    When I follow "Edit" within "tr#kahn_david_n"
    Then I should see "Edit Practice Member"
    When I fill in "practice_member_name_first" with "Michael"
    And I fill in "practice_member_name_middle" with "Louis"
    And I press "Submit"
    Then I should see "Practice Member successfully updated"
    And I should see "Kahn" within "td"
    And I should see "Michael" within "td"
    And I should see "Louis" within "td"
  
  Scenario: As a practice user I want to remove an existing Practice Member from the system
    Given there is a Practice Member in my practice named "Hello Kitty Practice" by the name of "Kahn, David N"
    Given I am on the home page
    When I follow "Delete" within "tr#kahn_david_n"
    Then I should see "Practice Member successfully deleted"
    And I should not see "Kahn"
    And I should not see "David"
  
