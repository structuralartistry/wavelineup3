require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Visit Feature", %q{

} do

  context "test aspects of Visit", :js => true do
    before(:each) do
      practice_name = 'StructuralArtistry practice'
      logged_in_as_role_for_practice(:practice_user, practice_name)
      practice_member = create_practice_member('Kahn, David Nathan', practice_name)
      @practice_room_visit_page = "/practice_room/#{practice_member.id}/visit"
      visit(@practice_room_visit_page)
      has_text?('Kahn, David N', 'h1') 
      confirm_visit_loaded   
    end
    
    scenario "I can set Phase 1 values and they autosave" do     
      get_selector_cell_text('selected_phase_1').should == ''
      click_selector_cell('selected_phase_1')

      selector_cell_present?('select_phase_1_2_C1').should == true
      selector_cell_present?('select_phase_1_2_C5').should == true
      selector_cell_present?('select_phase_1_3').should == true
      selector_cell_present?('select_phase_1_4').should == true
      selector_cell_present?('select_phase_1_5').should == true
      selector_cell_present?('select_phase_2_C1').should == true
      selector_cell_present?('select_phase_2_C5').should == true
      selector_cell_present?('select_phase_3').should == true
      selector_cell_present?('select_phase_4').should == true
      selector_cell_present?('select_phase_5').should == true

      click_selector_cell('select_phase_3')
      get_selector_cell_text('selected_phase_1').should == '3'

      get_selector_cell_text('selected_phase_1_gateway_1').should == ''
      click_selector_cell('selected_phase_1_gateway_1')

      selector_cell_present?('select_gateway_s1').should == true
      selector_cell_present?('select_gateway_s2').should == true
      selector_cell_present?('select_gateway_s3').should == true
      selector_cell_present?('select_gateway_s4').should == true
      selector_cell_present?('select_gateway_s5').should == true
      selector_cell_present?('select_gateway_cx').should == true

      click_selector_cell('select_gateway_s1')
      get_selector_cell_text('selected_phase_1_gateway_1').should == 'S1'

      get_selector_cell_text('selected_phase_1_gateway_2').should == ''
      click_selector_cell('selected_phase_1_gateway_2')

      selector_cell_present?('select_gateway_s1').should == false
      selector_cell_present?('select_gateway_s2').should == true
      selector_cell_present?('select_gateway_s3').should == true
      selector_cell_present?('select_gateway_s4').should == true
      selector_cell_present?('select_gateway_s5').should == true
      selector_cell_present?('select_gateway_cx').should == true
      selector_cell_present?('select_gateway_apex').should == true

      click_selector_cell('select_gateway_apex')
      get_selector_cell_text('selected_phase_1_gateway_2').should == 'APEX'
      
      get_selector_cell_text('selected_phase_1_direction').should == 'L/B' # auto set

      get_selector_cell_text('selected_phase_1_level_of_care').should == ''
      click_selector_cell('selected_phase_1_level_of_care')
      
      selector_cell_present?('select_level_of_care_1a').should == true
      selector_cell_present?('select_level_of_care_1b').should == true
      selector_cell_present?('select_level_of_care_1c').should == true
      selector_cell_present?('select_level_of_care_2a').should == true
      selector_cell_present?('select_level_of_care_2b').should == true
      selector_cell_present?('select_level_of_care_2c').should == true
      selector_cell_present?('select_level_of_care_3a').should == true
      selector_cell_present?('select_level_of_care_3b').should == true
      selector_cell_present?('select_level_of_care_3c').should == true
      selector_cell_present?('select_level_of_care_4').should == true
      
      click_selector_cell('select_level_of_care_3a')
      get_selector_cell_text('selected_phase_1_level_of_care').should == '3A'
    end
    
    scenario "selected phase 3 should autopopulate direction" do
      # phase 1
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_3')
      get_selector_cell_text('selected_phase_1').should == '3'
      get_selector_cell_text('selected_phase_1_direction').should == 'L/B'
      
      # phase 2
      click_selector_cell('work_second_phase_button')
      click_selector_cell('selected_phase_2')
      click_selector_cell('select_phase_3')
      get_selector_cell_text('selected_phase_2').should == '3'
      get_selector_cell_text('selected_phase_2_direction').should == 'L/B'
    end
    
    scenario "selected phase 1 > x should make available affected gateway selectors" do
      # phase 1
      has_text?('Aff', 'td').should == false
      selector_cell_present?('selected_phase_1_gateway_1_affecting').should == false
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_2_C1')
      get_selector_cell_text('selected_phase_1').should == '1 > 2 C1'
      
      has_text?('Aff', 'td').should == true
      
      # gw aff 1
      selector_cell_present?('selected_phase_1_gateway_1_affecting').should == true
      get_selector_cell_text('selected_phase_1_gateway_1_affecting').should == ''
      click_selector_cell('selected_phase_1_gateway_1_affecting')
      selector_cell_present?('select_gateway_c1_occ').should == true
      selector_cell_present?('select_gateway_c1_c2').should == true
      click_selector_cell('select_gateway_c1_c2')
      get_selector_cell_text('selected_phase_1_gateway_1_affecting').should == 'C1/C2'
      # gw aff 2
      selector_cell_present?('selected_phase_1_gateway_2_affecting').should == true
      get_selector_cell_text('selected_phase_1_gateway_2_affecting').should == ''
      click_selector_cell('selected_phase_1_gateway_2_affecting')
      selector_cell_present?('select_gateway_c1_occ').should == true
      selector_cell_present?('select_gateway_c1_c2').should == false # limited out of list based on first selection
      click_selector_cell('select_gateway_c1_occ')
      get_selector_cell_text('selected_phase_1_gateway_2_affecting').should == 'C1/OCC'
      
      
      # phase 2
      click_selector_cell('work_second_phase_button')
      selector_cell_present?('selected_phase_2_gateway_1_affecting').should == false
      click_selector_cell('selected_phase_2')
      click_selector_cell('select_phase_1_2_C1')
      get_selector_cell_text('selected_phase_2').should == '1 > 2 C1'
    
      # gw aff 1
      selector_cell_present?('selected_phase_2_gateway_1_affecting').should == true
      get_selector_cell_text('selected_phase_2_gateway_1_affecting').should == ''
      click_selector_cell('selected_phase_2_gateway_1_affecting')
      selector_cell_present?('select_gateway_c1_occ').should == true
      selector_cell_present?('select_gateway_c1_c2').should == true
      click_selector_cell('select_gateway_c1_c2')
      get_selector_cell_text('selected_phase_2_gateway_1_affecting').should == 'C1/C2'
      # gw aff 2
      selector_cell_present?('selected_phase_2_gateway_2_affecting').should == true
      get_selector_cell_text('selected_phase_2_gateway_2_affecting').should == ''
      click_selector_cell('selected_phase_2_gateway_2_affecting')
      selector_cell_present?('select_gateway_c1_occ').should == true
      selector_cell_present?('select_gateway_c1_c2').should == false # limited out of list based on first selection
      click_selector_cell('select_gateway_c1_occ')
      get_selector_cell_text('selected_phase_2_gateway_2_affecting').should == 'C1/OCC'
    end
    
    scenario "selected phase 5 has no direction" do
      # phase 1
      has_text?('Dir', 'td').should == true
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_5')
      get_selector_cell_text('selected_phase_1').should == '5'
      
      has_text?('Dir', 'td').should == false
      
      # phase 2
      click_selector_cell('work_second_phase_button')
      has_text?('Dir', 'td').should == true
      click_selector_cell('selected_phase_2')
      click_selector_cell('select_phase_5')
      get_selector_cell_text('selected_phase_2').should == '5'
      
      has_text?('Dir', 'td').should == false
    end
    
  
    # # move this to travel card
    #  scenario "travel card shows the right gateways with the right coloring" do 
    #  
    #  end
    #   
    #  scenario "if this practice member has a visit already today then show it, otherwise just show the new visit button" do
    #  
    #  end
    #   
    #  scenario "the mini-travel card should show the right gateways with the right coloring" do
    #  
    #  end
    #   
    #  scenario "the mini-travel card should highlight available gateways when a phase is selected for Phase 1" do
    #  
    #  end
    #   
    #  scenario "the mini-travel card should highlight available gateways when a phase is selected for Phase 2" do
    #  
    #  end
    #   
    #  scenario "values for Phase 1 can be set and autosave" do
    #  
    #  end
    #   
    #  scenario "values for Phase 2 can be set and autosave" do
    #  
    #  end
    #   
    #  scenario "values for Tension can be set and autosave" do
    #  
    #  end
    #   
    #  scenario "values for Advanced/Misc can be set and autosave" do
    #  
    #  end
    #   
    #  scenario "values for SRI can be set and autosave" do
    #  
    #  end
    #   
    #  scenario "values for Diagnosis and Notes can be set and autosave" do
    #  
    #  end
    #   
    #  scenario "I can change the date of a visit" do
    #  
    #  end
    #   
    #  scenario "I can delete a visit" do
    #  
    #  end
    #   
    #  scenario "I can see the Visit List" do
    #  
    #  end
    #   
    #  scenario "The Visit List refreshes when accessed to show even the newest Visit" do
    #  
    #  end 
    #   
    #  scenario "When I select a visit from the Visit List it shows in the Visit section" do
    #  
    #  end
    
  end

  
end
