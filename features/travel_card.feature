# to do
#   normalize so not putting "selector_id" in one place and "#selector_id" in the standard webstep
#   consider creating an alias lookup so can say "When I click the "Passive C1-C7 Tension Level selector"...

Feature: Travel Card
  
  @javascript
  Scenario: This is to set up the page for following Scenario Outline because it is sucky but I cant seem to put this to run once before a Scenario Outline
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
    When I go to the edit travel card page for Practice Member "Kahn, David N"
    Then I should see "Kahn, David N" within "h1"
  
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
  Scenario: Spot check the autosave functionality for L/R fields
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

    
  @javascript
  Scenario: Verify non L/R main travel card fields
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


    # verify autosave
    When I go to the edit travel card page for Practice Member "Kahn, David N"

    Then I should see "2C" within "#level_of_care"

    Then I should see "X" within "#full_respiratory_wave"

    Then I should see "E" within "#leading_bme_strategy"
    Then I should see "B" within "#second_bme_strategy"
    Then I should see "M" within "#third_bme_strategy"
    
    
      
      
  @javascript
  Scenario: Verify Tension Levels fields
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
    When I go to the edit travel card page for Practice Member "Kahn, David N"

    # show section
    Then I should not see "Tension" within "td"
    Then I should see the selector cell "Tension Levels" as not selected
    When I click "Tension Levels" within a selector cell
    Then I should see the selector cell "Tension Levels" as selected
    Then I should see "Tension" within "td"

    # operate on section

      # passive_c1_c7_tension_level
      Then I should see "" within "#passive_c1_c7_tension_level"
      Then I should not see "0" within "#tension_level_0"
      Then I should not see "1" within "#tension_level_1"
      Then I should not see "2" within "#tension_level_2"
      Then I should not see "3" within "#tension_level_3"
      Then I should not see "4" within "#tension_level_4"
      Then I should not see "5" within "#tension_level_5"
      When I click the selector cell "passive_c1_c7_tension_level"
      Then I should see "0" within "#tension_level_0"
      Then I should see "1" within "#tension_level_1"
      Then I should see "2" within "#tension_level_2"
      Then I should see "3" within "#tension_level_3"
      Then I should see "4" within "#tension_level_4"
      Then I should see "5" within "#tension_level_5"
      When I click the selector cell "tension_level_2"
      Then I should see "2" within "#passive_c1_c7_tension_level"

      # passive_t1_t12_tension_level
      Then I should see "" within "#passive_t1_t12_tension_level"
      Then I should not see "0" within "#tension_level_0"
      Then I should not see "1" within "#tension_level_1"
      Then I should not see "2" within "#tension_level_2"
      Then I should not see "3" within "#tension_level_3"
      Then I should not see "4" within "#tension_level_4"
      Then I should not see "5" within "#tension_level_5"
      When I click the selector cell "passive_t1_t12_tension_level"
      Then I should see "0" within "#tension_level_0"
      Then I should see "1" within "#tension_level_1"
      Then I should see "2" within "#tension_level_2"
      Then I should see "3" within "#tension_level_3"
      Then I should see "4" within "#tension_level_4"
      Then I should see "5" within "#tension_level_5"
      When I click the selector cell "tension_level_1"
      Then I should see "1" within "#passive_t1_t12_tension_level"

      # passive_l1_l5_tension_level
      Then I should see "" within "#passive_l1_l5_tension_level"
      Then I should not see "0" within "#tension_level_0"
      Then I should not see "1" within "#tension_level_1"
      Then I should not see "2" within "#tension_level_2"
      Then I should not see "3" within "#tension_level_3"
      Then I should not see "4" within "#tension_level_4"
      Then I should not see "5" within "#tension_level_5"
      When I click the selector cell "passive_l1_l5_tension_level"
      Then I should see "0" within "#tension_level_0"
      Then I should see "1" within "#tension_level_1"
      Then I should see "2" within "#tension_level_2"
      Then I should see "3" within "#tension_level_3"
      Then I should see "4" within "#tension_level_4"
      Then I should see "5" within "#tension_level_5"
      When I click the selector cell "tension_level_3"
      Then I should see "3" within "#passive_l1_l5_tension_level"

      # passive_s1_cx_tension_level
      Then I should see "" within "#passive_s1_cx_tension_level"
      Then I should not see "0" within "#tension_level_0"
      Then I should not see "1" within "#tension_level_1"
      Then I should not see "2" within "#tension_level_2"
      Then I should not see "3" within "#tension_level_3"
      Then I should not see "4" within "#tension_level_4"
      Then I should not see "5" within "#tension_level_5"
      When I click the selector cell "passive_s1_cx_tension_level"
      Then I should see "0" within "#tension_level_0"
      Then I should see "1" within "#tension_level_1"
      Then I should see "2" within "#tension_level_2"
      Then I should see "3" within "#tension_level_3"
      Then I should see "4" within "#tension_level_4"
      Then I should see "5" within "#tension_level_5"
      When I click the selector cell "tension_level_5"
      Then I should see "5" within "#passive_s1_cx_tension_level"


      # active_c1_c7_tension_level
      Then I should see "" within "#active_c1_c7_tension_level"
      Then I should not see "0" within "#tension_level_0"
      Then I should not see "1" within "#tension_level_1"
      Then I should not see "2" within "#tension_level_2"
      Then I should not see "3" within "#tension_level_3"
      Then I should not see "4" within "#tension_level_4"
      Then I should not see "5" within "#tension_level_5"
      When I click the selector cell "active_c1_c7_tension_level"
      Then I should see "0" within "#tension_level_0"
      Then I should see "1" within "#tension_level_1"
      Then I should see "2" within "#tension_level_2"
      Then I should see "3" within "#tension_level_3"
      Then I should see "4" within "#tension_level_4"
      Then I should see "5" within "#tension_level_5"
      When I click the selector cell "tension_level_4"
      Then I should see "4" within "#active_c1_c7_tension_level"

      # active_t1_t12_tension_level
      Then I should see "" within "#active_t1_t12_tension_level"
      Then I should not see "0" within "#tension_level_0"
      Then I should not see "1" within "#tension_level_1"
      Then I should not see "2" within "#tension_level_2"
      Then I should not see "3" within "#tension_level_3"
      Then I should not see "4" within "#tension_level_4"
      Then I should not see "5" within "#tension_level_5"
      When I click the selector cell "active_t1_t12_tension_level"
      Then I should see "0" within "#tension_level_0"
      Then I should see "1" within "#tension_level_1"
      Then I should see "2" within "#tension_level_2"
      Then I should see "3" within "#tension_level_3"
      Then I should see "4" within "#tension_level_4"
      Then I should see "5" within "#tension_level_5"
      When I click the selector cell "tension_level_3"
      Then I should see "3" within "#active_t1_t12_tension_level"

      # active_l1_l5_tension_level
      Then I should see "" within "#active_l1_l5_tension_level"
      Then I should not see "0" within "#tension_level_0"
      Then I should not see "1" within "#tension_level_1"
      Then I should not see "2" within "#tension_level_2"
      Then I should not see "3" within "#tension_level_3"
      Then I should not see "4" within "#tension_level_4"
      Then I should not see "5" within "#tension_level_5"
      When I click the selector cell "active_l1_l5_tension_level"
      Then I should see "0" within "#tension_level_0"
      Then I should see "1" within "#tension_level_1"
      Then I should see "2" within "#tension_level_2"
      Then I should see "3" within "#tension_level_3"
      Then I should see "4" within "#tension_level_4"
      Then I should see "5" within "#tension_level_5"
      When I click the selector cell "tension_level_1"
      Then I should see "1" within "#active_l1_l5_tension_level"

      # active_s1_cx_tension_level
      Then I should see "" within "#active_s1_cx_tension_level"
      Then I should not see "0" within "#tension_level_0"
      Then I should not see "1" within "#tension_level_1"
      Then I should not see "2" within "#tension_level_2"
      Then I should not see "3" within "#tension_level_3"
      Then I should not see "4" within "#tension_level_4"
      Then I should not see "5" within "#tension_level_5"
      When I click the selector cell "active_s1_cx_tension_level"
      Then I should see "0" within "#tension_level_0"
      Then I should see "1" within "#tension_level_1"
      Then I should see "2" within "#tension_level_2"
      Then I should see "3" within "#tension_level_3"
      Then I should see "4" within "#tension_level_4"
      Then I should see "5" within "#tension_level_5"
      When I click the selector cell "tension_level_2"
      Then I should see "2" within "#active_s1_cx_tension_level"

    # hide section
    When I click "Tension Levels" within a selector cell
    Then I should see the selector cell "Tension Levels" as not selected
    Then I should not see "Tension" within "td"

    # verify autosave
    When I go to the edit travel card page for Practice Member "Kahn, David N"
    
    When I click "Tension Levels" within a selector cell
    Then I should see "2" within "#passive_c1_c7_tension_level"
    Then I should see "1" within "#passive_t1_t12_tension_level"
    Then I should see "3" within "#passive_l1_l5_tension_level"
    Then I should see "5" within "#passive_s1_cx_tension_level"

    Then I should see "4" within "#active_c1_c7_tension_level"
    Then I should see "3" within "#active_t1_t12_tension_level"
    Then I should see "1" within "#active_l1_l5_tension_level"
    Then I should see "2" within "#active_s1_cx_tension_level"


  @javascript
  Scenario: Verify SRI section
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
    When I go to the edit travel card page for Practice Member "Kahn, David N"

    # show section
    Then I should not see "SRI P1 Aware" within "td"
    Then I should see the selector cell "SRI" as not selected
    When I click "SRI" within a selector cell
    Then I should see the selector cell "SRI" as selected
    Then I should see "SRI P1 Aware" within "td"

    # operate on section

      # sri_position_1_level_of_awareness
      Then I should see "" within "#sri_position_1_level_of_awareness"
      Then I should not see "0" within "#sri_level_of_awareness_0"
      Then I should not see "1" within "#sri_level_of_awareness_1"
      Then I should not see "2" within "#sri_level_of_awareness_2"
      Then I should not see "3" within "#sri_level_of_awareness_3"
      When I click the selector cell "sri_position_1_level_of_awareness"
      Then I should see "0" within "#sri_level_of_awareness_0"
      Then I should see "1" within "#sri_level_of_awareness_1"
      Then I should see "2" within "#sri_level_of_awareness_2"
      Then I should see "3" within "#sri_level_of_awareness_3"
      When I click the selector cell "sri_level_of_awareness_3"
      Then I should see "3" within "#sri_position_1_level_of_awareness"

      # sri_position_2_level_of_awareness
      Then I should see "" within "#sri_position_2_level_of_awareness"
      Then I should not see "0" within "#sri_level_of_awareness_0"
      Then I should not see "1" within "#sri_level_of_awareness_1"
      Then I should not see "2" within "#sri_level_of_awareness_2"
      Then I should not see "3" within "#sri_level_of_awareness_3"
      When I click the selector cell "sri_position_2_level_of_awareness"
      Then I should see "0" within "#sri_level_of_awareness_0"
      Then I should see "1" within "#sri_level_of_awareness_1"
      Then I should see "2" within "#sri_level_of_awareness_2"
      Then I should see "3" within "#sri_level_of_awareness_3"
      When I click the selector cell "sri_level_of_awareness_2"
      Then I should see "2" within "#sri_position_2_level_of_awareness"

      # sri_position_3_level_of_awareness
      Then I should see "" within "#sri_position_3_level_of_awareness"
      Then I should not see "0" within "#sri_level_of_awareness_0"
      Then I should not see "1" within "#sri_level_of_awareness_1"
      Then I should not see "2" within "#sri_level_of_awareness_2"
      Then I should not see "3" within "#sri_level_of_awareness_3"
      When I click the selector cell "sri_position_3_level_of_awareness"
      Then I should see "0" within "#sri_level_of_awareness_0"
      Then I should see "1" within "#sri_level_of_awareness_1"
      Then I should see "2" within "#sri_level_of_awareness_2"
      Then I should see "3" within "#sri_level_of_awareness_3"
      When I click the selector cell "sri_level_of_awareness_1"
      Then I should see "1" within "#sri_position_3_level_of_awareness"

      # sri_safety_position
      Then I should see "" within "#sri_safety_position"
      Then I should not see "1" within "#sri_position_1"
      Then I should not see "2" within "#sri_position_2"
      Then I should not see "3" within "#sri_position_3"
      Then I should not see "4" within "#sri_position_4"
      Then I should not see "5" within "#sri_position_5"
      Then I should not see "6" within "#sri_position_6"
      When I click the selector cell "sri_safety_position"
      Then I should see "1" within "#sri_position_1"
      Then I should see "2" within "#sri_position_2"
      Then I should see "3" within "#sri_position_3"
      Then I should see "4" within "#sri_position_4"
      Then I should see "5" within "#sri_position_5"
      Then I should see "6" within "#sri_position_6"
      When I click the selector cell "sri_position_4"
      Then I should see "4" within "#sri_safety_position"

      # travel_card_buzz_words_for_sri
      Then I should see "" within "#travel_card_buzz_words_for_sri"
      Then I fill in "travel_card_buzz_words_for_sri" with "I want my mommy!"

    # hide section
    When I click "SRI" within a selector cell
    Then I should see the selector cell "SRI" as not selected
    Then I should not see "SRI P1 Aware" within "td"

    # verify autosave
    When I go to the edit travel card page for Practice Member "Kahn, David N"
    When I click "SRI" within a selector cell
    Then I should see "3" within "#sri_position_1_level_of_awareness"
    Then I should see "2" within "#sri_position_2_level_of_awareness"
    Then I should see "1" within "#sri_position_3_level_of_awareness"
    Then I should see "4" within "#sri_safety_position" 
    Then I should see "I want my mommy!" within "#travel_card_buzz_words_for_sri"




  @javascript
  Scenario: Verify Programs/Education section
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
    When I go to the edit travel card page for Practice Member "Kahn, David N"

    # show section
    Then I should not see "Programs" within "td"
    Then I should see the selector cell "Programs/Education" as not selected
    When I click "Programs/Education" within a selector cell
    Then I should see the selector cell "Programs/Education" as selected
    Then I should see "Programs" within "td"

    # operate on section
    Then I should see "" within "#travel_card_number_gate"
    Then I should see "" within "#travel_card_number_sri"
    Then I should see "" within "#travel_card_number_hip"
    Then I should see "" within "#travel_card_number_ultima"
    Then I should see "" within "#travel_card_number_ultimatum"
    Then the "travel_card_book_12_stages" checkbox should not be checked
    Then the "travel_card_book_healing_magic" checkbox should not be checked
    
    Then I fill in "travel_card_number_gate" with "5"
    Then I fill in "travel_card_number_sri" with "4"
    Then I fill in "travel_card_number_hip" with "3"
    Then I fill in "travel_card_number_ultima" with "2"
    Then I fill in "travel_card_number_ultimatum" with "1"
    Then I check "travel_card_book_12_stages"
    Then I check "travel_card_book_healing_magic"

    # hide section
    When I click "Programs/Education" within a selector cell
    Then I should see the selector cell "Programs/Education" as not selected
    Then I should not see "Programs" within "td"

    # verify autosave
    When I go to the edit travel card page for Practice Member "Kahn, David N"
    When I click "Programs/Education" within a selector cell
    Then the "travel_card_number_gate" input field should contain "5"
    Then the "travel_card_number_sri" input field should contain "4"
    Then the "travel_card_number_hip" input field should contain "3"
    Then the "travel_card_number_ultima" input field should contain "2"
    Then the "travel_card_number_ultimatum" input field should contain "1"
    Then the "travel_card_book_12_stages" checkbox should be checked
    Then the "travel_card_book_healing_magic" checkbox should be checked 


  @javascript
  Scenario: Verify Notes section
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
    When I go to the edit travel card page for Practice Member "Kahn, David N"

    # show section
    Then I should not see "Notes" within "td"
    Then I should see the selector cell "Notes" as not selected
    When I click "Notes" within a selector cell
    Then I should see the selector cell "Notes" as selected
    Then I should see "Notes" within "td"

    # operate on section
    Then I should see "" within "#travel_card_notes"
    Then I fill in "travel_card_notes" with "Note on this travel card!"


    # hide section
    When I click "Notes" within a selector cell
    Then I should see the selector cell "Notes" as not selected
    Then I should not see "Notes" within "td"


    # verify autosave
    When I go to the edit travel card page for Practice Member "Kahn, David N"
    When I click "Notes" within a selector cell
    Then I should see "Note on this travel card!" within "#travel_card_notes"

