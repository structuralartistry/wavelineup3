require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Travel Card Feature", %q{
  In order to ...
  As a ...
  I want to ...
} do
  
  context "Verify Travel Card Javascript", :js => true, :travel_card => true do
    before(:each) do
      practice_name = 'StructuralArtistry practice'
      logged_in_as_role_for_practice(:practice_user, practice_name)
      practice_member = create_practice_member('Kahn, David Nathan', practice_name)
      travel_card_id = TravelCard.where("practice_member_id=#{practice_member.id}").first.id
      @travel_card_page = "/travel_cards/#{travel_card_id}/edit"
      visit(@travel_card_page)
      has_text?('Kahn, David N', 'h1')    
    end
  
    scenario "Verify L/R selectors" do
      lr_selector_cell_ids = %w(
      dominant_occiput
      gateway_occ_c1
      gateway_c1_occ
      gateway_c1_c2
      gateway_c2_c1
      gateway_c2_c3
      gateway_c3_c2
      gateway_c3_c4
      gateway_c4_c3
      gateway_c4_c5
      gateway_c5_c4
      gateway_c5_c6
      gateway_c6_c5
      gateway_c6_c7
      gateway_c7_c6
      gateway_c7_t1
      gateway_t1_c7
      gateway_t1_t2
      gateway_t2_t1
      gateway_t2_t3
      gateway_t3_t2
      gateway_s1
      gateway_s2
      gateway_s3
      gateway_s4
      gateway_s5
      gateway_cx)
    
      lr_selector_cell_ids.each do |lr_selector_cell_id|
        get_selector_cell_text(lr_selector_cell_id).should == ''
        click_selector_cell(lr_selector_cell_id)
        get_selector_cell_text(lr_selector_cell_id).should == 'L'
        click_selector_cell(lr_selector_cell_id)
        get_selector_cell_text(lr_selector_cell_id).should == 'R'
      end
    end
  
    scenario "Spot check autosave functionality" do
      get_selector_cell_text('dominant_occiput').should == ''
      click_selector_cell('dominant_occiput')
      get_selector_cell_text('dominant_occiput').should == 'L'
      visit(@travel_card_page)
      get_selector_cell_text('dominant_occiput').should == 'L'
      
      get_selector_cell_text('gateway_c6_c5').should == ''
      click_selector_cell('gateway_c6_c5')
      click_selector_cell('gateway_c6_c5')
      get_selector_cell_text('gateway_c6_c5').should == 'R'
      visit(@travel_card_page)
      get_selector_cell_text('gateway_c6_c5').should == 'R'
    end
    
    scenario "Verify LOC" do
      selector_cell_is_present?('1A').should == false
      get_selector_cell_text('level_of_care').should == ''
      click_selector_cell('level_of_care')
      selector_cell_is_present?('1A').should == true
      click_selector_cell('2C')
      get_selector_cell_text('level_of_care').should == '2C'
      
      visit(@travel_card_page)
      get_selector_cell_text('level_of_care').should == '2C'
    end
    
    scenario "Verify Respiratory Wave" do
      get_selector_cell_text('full_respiratory_wave').should == ''
      click_selector_cell('full_respiratory_wave')
      get_selector_cell_text('full_respiratory_wave').should == 'X'
      
      visit(@travel_card_page)
      get_selector_cell_text('full_respiratory_wave').should == 'X'
      
      click_selector_cell('full_respiratory_wave')
      get_selector_cell_text('full_respiratory_wave').should == ''
    end
    
    scenario "Verify BME strategy" do
      # note - using id to click the selector cell for BME otherwise if use text, 
      # is confusion as B can be a set value or the B in the BME selector
      selector_cell_is_present?('B').should == false
      
      get_selector_cell_text('leading_bme_strategy').should == ''
      get_selector_cell_text('second_bme_strategy').should == ''
      get_selector_cell_text('third_bme_strategy').should == ''
      
      # set leading to B
      click_selector_cell('leading_bme_strategy')
      click_selector_cell('bme_selector_b')
      get_selector_cell_text('leading_bme_strategy').should == 'B'
      
      # set second to M, third becomes E
      click_selector_cell('second_bme_strategy')
      click_selector_cell('bme_selector_m')
      get_selector_cell_text('second_bme_strategy').should == 'M'
      get_selector_cell_text('third_bme_strategy').should == 'E'
      
      # change second to B, leading becomes ''
      click_selector_cell('second_bme_strategy')
      click_selector_cell('bme_selector_b')
      get_selector_cell_text('second_bme_strategy').should == 'B'
      get_selector_cell_text('leading_bme_strategy').should == ''
      
      # set leading to E, third becomes M
      click_selector_cell('leading_bme_strategy')
      click_selector_cell('bme_selector_e')
      get_selector_cell_text('leading_bme_strategy').should == 'E'
      get_selector_cell_text('third_bme_strategy').should == 'M'
      
      visit(@travel_card_page)
      get_selector_cell_text('leading_bme_strategy').should == 'E'
      get_selector_cell_text('second_bme_strategy').should == 'B'
      get_selector_cell_text('third_bme_strategy').should == 'M'
    end
    
    scenario "Verify Tension Levels" do
      has_text?('Tension', 'td').should == false
      selector_cell_selected?('Tension Levels').should == false
      click_selector_cell('Tension Levels')
      has_text?('Tension', 'td').should == true
      selector_cell_selected?('Tension Levels').should == true
    end
  
  end
  
  
end

# 
#       # passive_c1_c7_tension_level
#       Then I should see "" within "#passive_c1_c7_tension_level"
#       Then I should not see "0" within "#tension_level_0"
#       Then I should not see "1" within "#tension_level_1"
#       Then I should not see "2" within "#tension_level_2"
#       Then I should not see "3" within "#tension_level_3"
#       Then I should not see "4" within "#tension_level_4"
#       Then I should not see "5" within "#tension_level_5"
#       When I click the selector cell "passive_c1_c7_tension_level"
#       Then I should see "0" within "#tension_level_0"
#       Then I should see "1" within "#tension_level_1"
#       Then I should see "2" within "#tension_level_2"
#       Then I should see "3" within "#tension_level_3"
#       Then I should see "4" within "#tension_level_4"
#       Then I should see "5" within "#tension_level_5"
#       When I click the selector cell "tension_level_2"
#       Then I should see "2" within "#passive_c1_c7_tension_level"
# 
#       # passive_t1_t12_tension_level
#       Then I should see "" within "#passive_t1_t12_tension_level"
#       Then I should not see "0" within "#tension_level_0"
#       Then I should not see "1" within "#tension_level_1"
#       Then I should not see "2" within "#tension_level_2"
#       Then I should not see "3" within "#tension_level_3"
#       Then I should not see "4" within "#tension_level_4"
#       Then I should not see "5" within "#tension_level_5"
#       When I click the selector cell "passive_t1_t12_tension_level"
#       Then I should see "0" within "#tension_level_0"
#       Then I should see "1" within "#tension_level_1"
#       Then I should see "2" within "#tension_level_2"
#       Then I should see "3" within "#tension_level_3"
#       Then I should see "4" within "#tension_level_4"
#       Then I should see "5" within "#tension_level_5"
#       When I click the selector cell "tension_level_1"
#       Then I should see "1" within "#passive_t1_t12_tension_level"
# 
#       # passive_l1_l5_tension_level
#       Then I should see "" within "#passive_l1_l5_tension_level"
#       Then I should not see "0" within "#tension_level_0"
#       Then I should not see "1" within "#tension_level_1"
#       Then I should not see "2" within "#tension_level_2"
#       Then I should not see "3" within "#tension_level_3"
#       Then I should not see "4" within "#tension_level_4"
#       Then I should not see "5" within "#tension_level_5"
#       When I click the selector cell "passive_l1_l5_tension_level"
#       Then I should see "0" within "#tension_level_0"
#       Then I should see "1" within "#tension_level_1"
#       Then I should see "2" within "#tension_level_2"
#       Then I should see "3" within "#tension_level_3"
#       Then I should see "4" within "#tension_level_4"
#       Then I should see "5" within "#tension_level_5"
#       When I click the selector cell "tension_level_3"
#       Then I should see "3" within "#passive_l1_l5_tension_level"
# 
#       # passive_s1_cx_tension_level
#       Then I should see "" within "#passive_s1_cx_tension_level"
#       Then I should not see "0" within "#tension_level_0"
#       Then I should not see "1" within "#tension_level_1"
#       Then I should not see "2" within "#tension_level_2"
#       Then I should not see "3" within "#tension_level_3"
#       Then I should not see "4" within "#tension_level_4"
#       Then I should not see "5" within "#tension_level_5"
#       When I click the selector cell "passive_s1_cx_tension_level"
#       Then I should see "0" within "#tension_level_0"
#       Then I should see "1" within "#tension_level_1"
#       Then I should see "2" within "#tension_level_2"
#       Then I should see "3" within "#tension_level_3"
#       Then I should see "4" within "#tension_level_4"
#       Then I should see "5" within "#tension_level_5"
#       When I click the selector cell "tension_level_5"
#       Then I should see "5" within "#passive_s1_cx_tension_level"
# 
# 
#       # active_c1_c7_tension_level
#       Then I should see "" within "#active_c1_c7_tension_level"
#       Then I should not see "0" within "#tension_level_0"
#       Then I should not see "1" within "#tension_level_1"
#       Then I should not see "2" within "#tension_level_2"
#       Then I should not see "3" within "#tension_level_3"
#       Then I should not see "4" within "#tension_level_4"
#       Then I should not see "5" within "#tension_level_5"
#       When I click the selector cell "active_c1_c7_tension_level"
#       Then I should see "0" within "#tension_level_0"
#       Then I should see "1" within "#tension_level_1"
#       Then I should see "2" within "#tension_level_2"
#       Then I should see "3" within "#tension_level_3"
#       Then I should see "4" within "#tension_level_4"
#       Then I should see "5" within "#tension_level_5"
#       When I click the selector cell "tension_level_4"
#       Then I should see "4" within "#active_c1_c7_tension_level"
# 
#       # active_t1_t12_tension_level
#       Then I should see "" within "#active_t1_t12_tension_level"
#       Then I should not see "0" within "#tension_level_0"
#       Then I should not see "1" within "#tension_level_1"
#       Then I should not see "2" within "#tension_level_2"
#       Then I should not see "3" within "#tension_level_3"
#       Then I should not see "4" within "#tension_level_4"
#       Then I should not see "5" within "#tension_level_5"
#       When I click the selector cell "active_t1_t12_tension_level"
#       Then I should see "0" within "#tension_level_0"
#       Then I should see "1" within "#tension_level_1"
#       Then I should see "2" within "#tension_level_2"
#       Then I should see "3" within "#tension_level_3"
#       Then I should see "4" within "#tension_level_4"
#       Then I should see "5" within "#tension_level_5"
#       When I click the selector cell "tension_level_3"
#       Then I should see "3" within "#active_t1_t12_tension_level"
# 
#       # active_l1_l5_tension_level
#       Then I should see "" within "#active_l1_l5_tension_level"
#       Then I should not see "0" within "#tension_level_0"
#       Then I should not see "1" within "#tension_level_1"
#       Then I should not see "2" within "#tension_level_2"
#       Then I should not see "3" within "#tension_level_3"
#       Then I should not see "4" within "#tension_level_4"
#       Then I should not see "5" within "#tension_level_5"
#       When I click the selector cell "active_l1_l5_tension_level"
#       Then I should see "0" within "#tension_level_0"
#       Then I should see "1" within "#tension_level_1"
#       Then I should see "2" within "#tension_level_2"
#       Then I should see "3" within "#tension_level_3"
#       Then I should see "4" within "#tension_level_4"
#       Then I should see "5" within "#tension_level_5"
#       When I click the selector cell "tension_level_1"
#       Then I should see "1" within "#active_l1_l5_tension_level"
# 
#       # active_s1_cx_tension_level
#       Then I should see "" within "#active_s1_cx_tension_level"
#       Then I should not see "0" within "#tension_level_0"
#       Then I should not see "1" within "#tension_level_1"
#       Then I should not see "2" within "#tension_level_2"
#       Then I should not see "3" within "#tension_level_3"
#       Then I should not see "4" within "#tension_level_4"
#       Then I should not see "5" within "#tension_level_5"
#       When I click the selector cell "active_s1_cx_tension_level"
#       Then I should see "0" within "#tension_level_0"
#       Then I should see "1" within "#tension_level_1"
#       Then I should see "2" within "#tension_level_2"
#       Then I should see "3" within "#tension_level_3"
#       Then I should see "4" within "#tension_level_4"
#       Then I should see "5" within "#tension_level_5"
#       When I click the selector cell "tension_level_2"
#       Then I should see "2" within "#active_s1_cx_tension_level"
# 
#     # hide section
#     When I click "Tension Levels" within a selector cell
#     Then I should see the selector cell "Tension Levels" as not selected
#     Then I should not see "Tension" within "td"
# 
#     # verify autosave
#     When I go to the edit travel card page for Practice Member "Kahn, David N"
#     
#     When I click "Tension Levels" within a selector cell
#     Then I should see "2" within "#passive_c1_c7_tension_level"
#     Then I should see "1" within "#passive_t1_t12_tension_level"
#     Then I should see "3" within "#passive_l1_l5_tension_level"
#     Then I should see "5" within "#passive_s1_cx_tension_level"
# 
#     Then I should see "4" within "#active_c1_c7_tension_level"
#     Then I should see "3" within "#active_t1_t12_tension_level"
#     Then I should see "1" within "#active_l1_l5_tension_level"
#     Then I should see "2" within "#active_s1_cx_tension_level"
# 
# 
#   @javascript
#   Scenario: Verify SRI section
#     Given I am logged in in a "practice user" user role for the practice "Demo Practice"
#     Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
#     When I go to the edit travel card page for Practice Member "Kahn, David N"
# 
#     # show section
#     Then I should not see "SRI P1 Aware" within "td"
#     Then I should see the selector cell "SRI" as not selected
#     When I click "SRI" within a selector cell
#     Then I should see the selector cell "SRI" as selected
#     Then I should see "SRI P1 Aware" within "td"
# 
#     # operate on section
# 
#       # sri_position_1_level_of_awareness
#       Then I should see "" within "#sri_position_1_level_of_awareness"
#       Then I should not see "0" within "#sri_level_of_awareness_0"
#       Then I should not see "1" within "#sri_level_of_awareness_1"
#       Then I should not see "2" within "#sri_level_of_awareness_2"
#       Then I should not see "3" within "#sri_level_of_awareness_3"
#       When I click the selector cell "sri_position_1_level_of_awareness"
#       Then I should see "0" within "#sri_level_of_awareness_0"
#       Then I should see "1" within "#sri_level_of_awareness_1"
#       Then I should see "2" within "#sri_level_of_awareness_2"
#       Then I should see "3" within "#sri_level_of_awareness_3"
#       When I click the selector cell "sri_level_of_awareness_3"
#       Then I should see "3" within "#sri_position_1_level_of_awareness"
# 
#       # sri_position_2_level_of_awareness
#       Then I should see "" within "#sri_position_2_level_of_awareness"
#       Then I should not see "0" within "#sri_level_of_awareness_0"
#       Then I should not see "1" within "#sri_level_of_awareness_1"
#       Then I should not see "2" within "#sri_level_of_awareness_2"
#       Then I should not see "3" within "#sri_level_of_awareness_3"
#       When I click the selector cell "sri_position_2_level_of_awareness"
#       Then I should see "0" within "#sri_level_of_awareness_0"
#       Then I should see "1" within "#sri_level_of_awareness_1"
#       Then I should see "2" within "#sri_level_of_awareness_2"
#       Then I should see "3" within "#sri_level_of_awareness_3"
#       When I click the selector cell "sri_level_of_awareness_2"
#       Then I should see "2" within "#sri_position_2_level_of_awareness"
# 
#       # sri_position_3_level_of_awareness
#       Then I should see "" within "#sri_position_3_level_of_awareness"
#       Then I should not see "0" within "#sri_level_of_awareness_0"
#       Then I should not see "1" within "#sri_level_of_awareness_1"
#       Then I should not see "2" within "#sri_level_of_awareness_2"
#       Then I should not see "3" within "#sri_level_of_awareness_3"
#       When I click the selector cell "sri_position_3_level_of_awareness"
#       Then I should see "0" within "#sri_level_of_awareness_0"
#       Then I should see "1" within "#sri_level_of_awareness_1"
#       Then I should see "2" within "#sri_level_of_awareness_2"
#       Then I should see "3" within "#sri_level_of_awareness_3"
#       When I click the selector cell "sri_level_of_awareness_1"
#       Then I should see "1" within "#sri_position_3_level_of_awareness"
# 
#       # sri_safety_position
#       Then I should see "" within "#sri_safety_position"
#       Then I should not see "1" within "#sri_position_1"
#       Then I should not see "2" within "#sri_position_2"
#       Then I should not see "3" within "#sri_position_3"
#       Then I should not see "4" within "#sri_position_4"
#       Then I should not see "5" within "#sri_position_5"
#       Then I should not see "6" within "#sri_position_6"
#       When I click the selector cell "sri_safety_position"
#       Then I should see "1" within "#sri_position_1"
#       Then I should see "2" within "#sri_position_2"
#       Then I should see "3" within "#sri_position_3"
#       Then I should see "4" within "#sri_position_4"
#       Then I should see "5" within "#sri_position_5"
#       Then I should see "6" within "#sri_position_6"
#       When I click the selector cell "sri_position_4"
#       Then I should see "4" within "#sri_safety_position"
# 
#       # travel_card_buzz_words_for_sri
#       Then I should see "" within "#travel_card_buzz_words_for_sri"
#       Then I fill in "travel_card_buzz_words_for_sri" with "I want my mommy!"
# 
#     # hide section
#     When I click "SRI" within a selector cell
#     Then I should see the selector cell "SRI" as not selected
#     Then I should not see "SRI P1 Aware" within "td"
# 
#     # verify autosave
#     When I go to the edit travel card page for Practice Member "Kahn, David N"
#     When I click "SRI" within a selector cell
#     Then I should see "3" within "#sri_position_1_level_of_awareness"
#     Then I should see "2" within "#sri_position_2_level_of_awareness"
#     Then I should see "1" within "#sri_position_3_level_of_awareness"
#     Then I should see "4" within "#sri_safety_position" 
#     Then I should see "I want my mommy!" within "#travel_card_buzz_words_for_sri"
# 
# 
# 
# 
#   @javascript
#   Scenario: Verify Programs/Education section
#     Given I am logged in in a "practice user" user role for the practice "Demo Practice"
#     Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
#     When I go to the edit travel card page for Practice Member "Kahn, David N"
# 
#     # show section
#     Then I should not see "Programs" within "td"
#     Then I should see the selector cell "Programs/Education" as not selected
#     When I click "Programs/Education" within a selector cell
#     Then I should see the selector cell "Programs/Education" as selected
#     Then I should see "Programs" within "td"
# 
#     # operate on section
#     Then I should see "" within "#travel_card_number_gate"
#     Then I should see "" within "#travel_card_number_sri"
#     Then I should see "" within "#travel_card_number_hip"
#     Then I should see "" within "#travel_card_number_ultima"
#     Then I should see "" within "#travel_card_number_ultimatum"
#     Then the "travel_card_book_12_stages" checkbox should not be checked
#     Then the "travel_card_book_healing_magic" checkbox should not be checked
#     
#     Then I fill in "travel_card_number_gate" with "5"
#     Then I fill in "travel_card_number_sri" with "4"
#     Then I fill in "travel_card_number_hip" with "3"
#     Then I fill in "travel_card_number_ultima" with "2"
#     Then I fill in "travel_card_number_ultimatum" with "1"
#     Then I check "travel_card_book_12_stages"
#     Then I check "travel_card_book_healing_magic"
# 
#     # hide section
#     When I click "Programs/Education" within a selector cell
#     Then I should see the selector cell "Programs/Education" as not selected
#     Then I should not see "Programs" within "td"
# 
#     # verify autosave
#     When I go to the edit travel card page for Practice Member "Kahn, David N"
#     When I click "Programs/Education" within a selector cell
#     Then the "travel_card_number_gate" input field should contain "5"
#     Then the "travel_card_number_sri" input field should contain "4"
#     Then the "travel_card_number_hip" input field should contain "3"
#     Then the "travel_card_number_ultima" input field should contain "2"
#     Then the "travel_card_number_ultimatum" input field should contain "1"
#     Then the "travel_card_book_12_stages" checkbox should be checked
#     Then the "travel_card_book_healing_magic" checkbox should be checked 
# 
# 
#   @javascript
#   Scenario: Verify Notes section
#     Given I am logged in in a "practice user" user role for the practice "Demo Practice"
#     Given there is a Practice Member in my practice named "Demo Practice" by the name of "Kahn, David N"
#     When I go to the edit travel card page for Practice Member "Kahn, David N"
# 
#     # show section
#     Then I should not see "Notes" within "td"
#     Then I should see the selector cell "Notes" as not selected
#     When I click "Notes" within a selector cell
#     Then I should see the selector cell "Notes" as selected
#     Then I should see "Notes" within "td"
# 
#     # operate on section
#     Then I should see "" within "#travel_card_notes"
#     Then I fill in "travel_card_notes" with "Note on this travel card!"
# 
# 
#     # hide section
#     When I click "Notes" within a selector cell
#     Then I should see the selector cell "Notes" as not selected
#     Then I should not see "Notes" within "td"
# 
# 
#     # verify autosave
#     When I go to the edit travel card page for Practice Member "Kahn, David N"
#     When I click "Notes" within a selector cell
#     Then I should see "Note on this travel card!" within "#travel_card_notes"
# 

