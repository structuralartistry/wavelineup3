Feature: Practice Member Selector 
  Shows all practice members, filters them by alphabet and selects what page to navigate to
  
  Background:
    Given I am logged in in a "practice admin" user role for the practice "Hello Kitty Practice"
    Given there is a Practice Member in my practice named "Hello Kitty Practice" by the name of "Kahn, David N"
    Given there is a Practice Member in my practice named "Hello Kitty Practice" by the name of "Apple, John"
    Given I am on the home page
    # verify that selector is hidden
    Then I should not see "Travel Card" within "td"
    Then I should not see "Edit Personal Info" within "td"
    Then I should not see "Kahn, David N" within "td"
    Then I should not see "Apple, John" within "td"
    
  @javascript
  Scenario: The Practice Member Selector shows when I click find and closes when I click close
    When I click "Find" within a selector cell
    Then I should see the selector cell "Find" as selected
    Then I should see "Travel Card" within a selector cell
    Then I should see "Edit Personal Info" within a selector cell
    Then I should see "Kahn, David N" within a selector cell
    Then I should see "Apple, John" within a selector cell
    When I click "Find" within a selector cell
    Then I should see the selector cell "Find" as not selected
    Then I should not see "Travel Card" within a selector cell
    Then I should not see "Edit Personal Info" within a selector cell
    Then I should not see "Kahn, David N" within a selector cell
    Then I should not see "Apple, John" within a selector cell
    
  @javascript
  Scenario: I can use the Practice Member Selector to select a Practice Member and edit their personal information
    When I click "Find" within a selector cell
    When I click "Edit Personal Info" within a selector cell
    And I click "Kahn, David N" within a selector cell
    Then I should see "Edit Practice Member" within "h1"
    
  @javascript
  Scenario: I can use the Practice Member Selector to select a Practice Member and view their Travel Card
    When I click "Find" within a selector cell
    When I click "Travel Card" within a selector cell
    And I click "Kahn, David N" within a selector cell
    Then I should see "Kahn, David N" within "h1"
    
     
  @javascript
  Scenario: I can click on the "K" alphabet key and only see practice members whose last name starts with "K"
    When I click "Find" within a selector cell
    Then I should see "Kahn, David N" within a selector cell
    Then I should see "Apple, John" within a selector cell
    When I click "K" within a selector cell
    Then I should see "Kahn, David N" within a selector cell
    Then I should not see "Apple, John" within a selector cell