#Feature: Practice member administration
#
#  Scenario: As a practice user I want to add a new Practice Member to the system
#    Given I am logged in in a "Practice Admin" user role
#    Given I am on the home page
#    When I fill in "name_last" with "Kahn" within "new_practice_member_form"
#    And I fill in "name_first" with "David" within "new_practice_member_form"
#    And I fill in "name_middle" with "N" within "new_practice_member_form"
#    And I press "Submit"
#    Then I should see "New Practice Member successfully created"
#    And I should see "Kahn" within "td"
#    And I should see "David" within "td"
#    And I should see "N" within "td"
#    
#  Scenario: As a practice user I want to modify an existing Practice Member in the system
#    Given I am logged in in a "Practice Admin" user role
#    Given I am on the home page
#    Given there is a Practice Member in my practice named "Kahn, David N"
#    When I follow "Edit" within "tr#kahn_david_n"
#    Then I should see "Edit Practice Member"
#    When I fill in "name_first" with "Michael"
#    And I fill in "name_middle" with "Louis"
#    And I press "Submit"
#    Then I should see "Practice Member successfully updated"
#    And I should see "Kahn" within "td"
#    And I should see "Michael" within "td"
#    And I should see "Louis" within "td"
#  
#  Scenario: As a practice user I want to remove an existing Practice Member from the system
#    Given I am logged in in a "Practice Admin" user role
#    Given I am on the home page
#    Given there is a Practice Member in my practice named "Kahn, David N"
#    When I follow "Delete" within "tr#kahn_david_n"
#    Then I should see "Practice Member successfully deleted"
#    And I should not see "Kahn" within "td"
#    And I should not see "David" within "td"
#    And I should not see "N" within "td"
#  
