Feature: Practice member administration

  Background:
    Given I am logged in in a "practice admin" user role for the practice "Hello Kitty Practice"

  @javascript
  Scenario: As a practice user I want to add a new Practice Member to the system
    Given I am on the home page
    When I fill in "practice_member_name_last" with "Kahn" within "form#new_practice_member"
    And I fill in "practice_member_name_first" with "David" within "form#new_practice_member"
    And I fill in "practice_member_name_middle" with "N" within "form#new_practice_member"
    And I press "Submit"
    Then I should see "Practice Member successfully created"
    When I click "Find" within a selector cell
    Then I should see "Kahn, David N" within a selector cell
    
  @javascript
  Scenario: As a practice user I want to modify an existing Practice Member in the system
    Given there is a Practice Member in my practice named "Hello Kitty Practice" by the name of "Kahn, David N"
    Given I am on the home page
    When I click "Find" within a selector cell
    When I click "Edit Personal Info" within a selector cell
    When I click "Kahn, David N" within a selector cell
    Then I should see "Edit Practice Member" within "h1"
    When I fill in "practice_member_name_first" with "Michael"
    And I fill in "practice_member_name_middle" with "Louis"
    And I press "Submit"
    Then I should see "Practice Member successfully updated"
    When I click "Find" within a selector cell
    Then I should see "Kahn, Michael Louis" within a selector cell
    
  @javascript
  Scenario: As a practice user I want to remove an existing Practice Member from the system
    Given there is a Practice Member in my practice named "Hello Kitty Practice" by the name of "Doe, John"
    Given there is a Practice Member in my practice named "Hello Kitty Practice" by the name of "Kahn, David N"
    Given I am on the home page
    When I click "Find" within a selector cell
    When I click "Edit Personal Info" within a selector cell
    When I click "Kahn, David N" within a selector cell
    Then I should see "Edit Practice Member" within "h1"
    Then tell the page to accept the confirm dialog which is coming
    When I press "Delete"
    Then I should see "Practice Member successfully deleted"
    When I click "Find" within a selector cell
    Then I should not see "Kahn, David N" within a selector cell
  
