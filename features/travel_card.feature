Feature: Travel Card
# this all works
  @javascript
  Scenario: When I select or enter a value for each field on the Travel Card, the field autosaves
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
    When I go to the edit travel card page for Practice Member "Kahn, David N"
    
    # test toggle and set value
    Then I should see "^$" within the "dominant_occiput" selector cell
    When I click the selector cell "dominant_occiput"
    Then I should see "L" within the "dominant_occiput" selector cell
    When I click the selector cell "dominant_occiput"
    Then I should see "R" within the "dominant_occiput" selector cell
# end working    
     #    
     # gateway_occ_c1
     # gateway_c1_occ
     # gateway_c1_c2
     # gateway_c2_c1
     # gateway_c2_c3
     # gateway_c3_c2
     # gateway_c3_c4
     # gateway_c4_c3
     # gateway_c4_c5
     # gateway_c5_c4
     # gateway_c5_c6
     # gateway_c6_c5
     # gateway_c6_c7
     # gateway_c7_c6
     # gateway_c7_t1
     # gateway_t1_c7
     # gateway_t1_t2
     # gateway_t2_t1
     # gateway_t2_t3
     # gateway_t3_t2
     # gateway_s1
     # gateway_s2
     # gateway_s3
     # gateway_s4
     # gateway_s5
     # gateway_cx
     # 
     # 
     # 
     # # test that all values autosaved
     # When I go to the edit travel card page for Practice Member "Kahn, David N"
     # Then I should see "R" within the "dominant_occiput" selector cell
     # 
     # 
     # 
     # 
     # 
     # Background:
     # 
     # 