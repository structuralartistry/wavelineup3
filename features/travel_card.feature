Feature: Travel Card
  
  @javascript
  Scenario: This is to set up the page for following Scenario Outline because it is sucky but I cant seem to put this to run once before a Scenario Outline
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
    When I go to the edit travel card page for Practice Member "Kahn, David N"
  
  @javascript
  Scenario Outline: Verify Left/Right selectors 
    Then I should see "" within "#<selector_cell_id>"
    When I click the selector cell "<selector_cell_id>"
    Then I should see "L" within "#<selector_cell_id>"
    Then I click the selector cell "<selector_cell_id>"
    Then I should see "R" within "#<selector_cell_id>"
    Scenarios: do on all L/R selectors
      | selector_cell_id |
      | dominant_occiput |
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
      
  @javascript
  Scenario: Verify non L/R selectors
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
    When I go to the edit travel card page for Practice Member "Kahn, David N"
    
    # level of care
    Then I should not see "1A" within a selector cell
    Then I should see "" within "#level_of_care"
    When I click the selector cell "level_of_care"
    Then I should see "1A" within a selector cell
    When I click "2C" within a selector cell
    Then I should see "2C" within "#level_of_care"
    
    # respiratory wave
    Then I should see "" within "#full_respiratory_wave"
    When I click the selector cell "full_respiratory_wave"
    Then I should see "X" within "#full_respiratory_wave"
    When I click the selector cell "full_respiratory_wave"
    Then I should see "" within "#full_respiratory_wave"
    When I click the selector cell "full_respiratory_wave"
    Then I should see "X" within "#full_respiratory_wave"
    
    # bme strategy
      # no selector
      Then I should not see "B" within a selector cell
      Then I should not see "M" within a selector cell
      Then I should not see "E" within a selector cell
      
      # no values
      Then I should see "" within "#leading_bme_strategy"
      Then I should see "" within "#second_bme_strategy"
      Then I should see "" within "#third_bme_strategy"
      
      # set leading as B
      When I click the selector cell "leading_bme_strategy"
      Then I should see "B" within a selector cell
      Then I should see "M" within a selector cell
      Then I should see "E" within a selector cell
      When I click the selector cell "bme_selector_b"
      Then I should see "B" within "#leading_bme_strategy"
      
      # set second as M
      When I click the selector cell "second_bme_strategy"
      Then I should see "B" within a selector cell
      Then I should see "M" within a selector cell
      Then I should see "E" within a selector cell
      When I click the selector cell "bme_selector_m"
      Then I should see "M" within "#second_bme_strategy"
      
      # verify third should autoset as E
      Then I should see "E" within "#third_bme_strategy"
      
      # change second to B and verify leading reset
      When I click the selector cell "second_bme_strategy"
      When I click the selector cell "bme_selector_b"
      Then I should see "B" within "#second_bme_strategy"
      Then I should see "" within "#leading_bme_strategy"
      
      # set the leading to E
      When I click the selector cell "leading_bme_strategy"
      When I click the selector cell "bme_selector_e"
      Then I should see "E" within "#leading_bme_strategy"
      
      # verify third should autoset to M
      Then I should see "M" within "#third_bme_strategy"
      
      
      # 
      # # set leading with another strategy and verify that third strategy autosets
      # When I click the selector cell "leading_bme_strategy"
      # Then I should see "B" within a selector cell
      # Then I should see "E" within a selector cell
      # Then I should see "M" within a selector cell
      # When I click "E" within a selector cell
      # Then I should see "E" within "#leading_bme_strategy"
      
    
    # verify autosave
    When I go to the edit travel card page for Practice Member "Kahn, David N"
    Then I should see "2C" within "#level_of_care"
    Then I should see "X" within "#full_respiratory_wave"
    Then I should see "E" within "#leading_bme_strategy"
    Then I should see "B" within "#second_bme_strategy"
    Then I should see "M" within "#third_bme_strategy"
    
    
  
  @javascript
  Scenario: Spot check the autosave functionality
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
    When I go to the edit travel card page for Practice Member "Kahn, David N"

    Then I should see "" within "#dominant_occiput"
    When I click the selector cell "dominant_occiput"
    Then I should see "L" within "#dominant_occiput"
    
    When I go to the edit travel card page for Practice Member "Kahn, David N"
    Then I should see "L" within "#dominant_occiput"
    
    Then I should see "" within "#gateway_c6_c5"
    When I click the selector cell "gateway_c6_c5"
    When I click the selector cell "gateway_c6_c5"
    Then I should see "R" within "#gateway_c6_c5"
    
    When I go to the edit travel card page for Practice Member "Kahn, David N"
    Then I should see "R" within "#gateway_c6_c5"
    
    
        

      
# now verify autosave on all vals by reloading page

