Feature: Travel Card

  Before do
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
    When I go to the edit travel card page for Practice Member "Kahn, David N"
  end
  



  @javascript
  Scenario: When I select or enter a value for each field on the Travel Card, the field autosaves
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
    When I go to the edit travel card page for Practice Member "Kahn, David N"
    
    # test toggle and set value
    Then I should see "" within "#dominant_occiput"
    When I click the selector cell "dominant_occiput"
    Then I should see "L" within "#dominant_occiput"
    When I click the selector cell "dominant_occiput"
    Then I should see "R" within "#dominant_occiput"

     


  @javascript
  Scenario Outline: submit guess 
    Then I should see "" within "#<selector_cell_id>"
    When I click the selector cell "<selector_cell_id>"
    Then I should see "L" within "#<selector_cell_id>"
    Then I click the selector cell "<selector_cell_id>"
    Then I should see "R" within "#<selector_cell_id>"
    Scenarios: do on all L/R selectors
      | selector_cell_id |
      | gateway_occ_c1 |
      | gateway_c1_occ |
      | gateway_c1_c2 |
      | gateway_c2_c1 |
      | gateway_c2_c3 |
      | gateway_c3_c2 |
      | gateway_c3_c4 |
      | gateway_c4_c3 |
      | gateway_c4_c5 |
      | gateway_c5_c4 |
      | gateway_c5_c6 |
      | gateway_c6_c5 |
      | gateway_c6_c7 |
      | gateway_c7_c6 |
      | gateway_c7_t1 |
      | gateway_t1_c7 |
      | gateway_t1_t2 |
      | gateway_t2_t1 |
      | gateway_t2_t3 |
      | gateway_t3_t2 |
      | gateway_s1 |
      | gateway_s2 |
      | gateway_s3 |
      | gateway_s4 |
      | gateway_s5 |
      | gateway_cx |
      
# now verify autosave on all vals by reloading page

