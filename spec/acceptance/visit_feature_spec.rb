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
    
    scenario "I can set Phase 1 and 2 values and they autosave and that affected gateway selectors show for phase 1" do  
      # phase 1   
      get_selector_cell_text('selected_phase_1').should == ''
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_2_c5')
      get_selector_cell_text('selected_phase_1').should == '1 > 2 C5'

      get_selector_cell_text('selected_phase_1_gateway_1').should == ''
      click_selector_cell('selected_phase_1_gateway_1')
      click_selector_cell('select_gateway_s1')
      get_selector_cell_text('selected_phase_1_gateway_1').should == 'S1'
      
      get_selector_cell_text('selected_phase_1_gateway_1_affecting').should == ''
      click_selector_cell('selected_phase_1_gateway_1_affecting')
      click_selector_cell('select_gateway_c3_c4')
      get_selector_cell_text('selected_phase_1_gateway_1_affecting').should == 'C3/C4'

      get_selector_cell_text('selected_phase_1_gateway_2').should == ''
      click_selector_cell('selected_phase_1_gateway_2')
      selector_cell_present?('select_gateway_s1').should == false # second gateway can not be set to value of first
      click_selector_cell('select_gateway_s2')
      get_selector_cell_text('selected_phase_1_gateway_2').should == 'S2'
      
      get_selector_cell_text('selected_phase_1_gateway_2_affecting').should == ''
      click_selector_cell('selected_phase_1_gateway_2_affecting')
      selector_cell_present?('select_gateway_c3_c4').should == false
      click_selector_cell('select_gateway_c4_c3')
      get_selector_cell_text('selected_phase_1_gateway_2_affecting').should == 'C4/C3'
      
      get_selector_cell_text('selected_phase_1_direction').should == ''
      click_selector_cell('selected_phase_1_direction')
      click_selector_cell('select_direction_f_e')
      get_selector_cell_text('selected_phase_1_direction').should == 'F/E'
 
      get_selector_cell_text('selected_phase_1_level_of_care').should == ''
      click_selector_cell('selected_phase_1_level_of_care')   
      click_selector_cell('select_level_of_care_3a')
      get_selector_cell_text('selected_phase_1_level_of_care').should == '3A'
      
      
      # phase 2
      click_selector_cell('work_second_phase_button')
      
      get_selector_cell_text('selected_phase_2').should == ''
      click_selector_cell('selected_phase_2')
      click_selector_cell('select_phase_1_2_c5')
      get_selector_cell_text('selected_phase_2').should == '1 > 2 C5'

      get_selector_cell_text('selected_phase_2_gateway_1').should == ''
      click_selector_cell('selected_phase_2_gateway_1')
      click_selector_cell('select_gateway_s1')
      get_selector_cell_text('selected_phase_2_gateway_1').should == 'S1'
      
      get_selector_cell_text('selected_phase_2_gateway_1_affecting').should == ''
      click_selector_cell('selected_phase_2_gateway_1_affecting')
      click_selector_cell('select_gateway_c3_c4')
      get_selector_cell_text('selected_phase_2_gateway_1_affecting').should == 'C3/C4'

      get_selector_cell_text('selected_phase_2_gateway_2').should == ''
      click_selector_cell('selected_phase_2_gateway_2')
      selector_cell_present?('select_gateway_s1').should == false # second gateway can not be set to value of first
      click_selector_cell('select_gateway_s2')
      get_selector_cell_text('selected_phase_2_gateway_2').should == 'S2'
      
      get_selector_cell_text('selected_phase_2_gateway_2_affecting').should == ''
      click_selector_cell('selected_phase_2_gateway_2_affecting')
      selector_cell_present?('select_gateway_c3_c4').should == false
      click_selector_cell('select_gateway_c4_c3')
      get_selector_cell_text('selected_phase_2_gateway_2_affecting').should == 'C4/C3'
      
      get_selector_cell_text('selected_phase_2_direction').should == ''
      click_selector_cell('selected_phase_2_direction')
      click_selector_cell('select_direction_f_e')
      get_selector_cell_text('selected_phase_2_direction').should == 'F/E'
 
      get_selector_cell_text('selected_phase_2_level_of_care').should == ''
      click_selector_cell('selected_phase_2_level_of_care')   
      click_selector_cell('select_level_of_care_3a')
      get_selector_cell_text('selected_phase_2_level_of_care').should == '3A'
      
      
      # verify autosave
      visit(@practice_room_visit_page)
      # phase 1   
      get_selector_cell_text('selected_phase_1').should == '1 > 2 C5'
      get_selector_cell_text('selected_phase_1_gateway_1').should == 'S1'
      get_selector_cell_text('selected_phase_1_gateway_1_affecting').should == 'C3/C4'
      get_selector_cell_text('selected_phase_1_gateway_2').should == 'S2'
      get_selector_cell_text('selected_phase_1_gateway_2_affecting').should == 'C4/C3'
      get_selector_cell_text('selected_phase_1_direction').should == 'F/E'
      get_selector_cell_text('selected_phase_1_level_of_care').should == '3A'
      
      
      # phase 2
      click_selector_cell('work_second_phase_button')
      
      get_selector_cell_text('selected_phase_2').should == '1 > 2 C5'
      get_selector_cell_text('selected_phase_2_gateway_1').should == 'S1'
      get_selector_cell_text('selected_phase_2_gateway_1_affecting').should == 'C3/C4'
      get_selector_cell_text('selected_phase_2_gateway_2').should == 'S2'
      get_selector_cell_text('selected_phase_2_gateway_2_affecting').should == 'C4/C3'
      get_selector_cell_text('selected_phase_2_direction').should == 'F/E'
      get_selector_cell_text('selected_phase_2_level_of_care').should == '3A'
            
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
    # 
    # scenario "gateway side should show on gateway selector in red" do
    #   
    # end 
    #   
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
