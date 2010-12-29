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

# need to change all verifications to id's
# broken test... just check by id, dont worry if it is a selector cell....

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

      selector_cell_present?('S1').should == true
      selector_cell_present?('S2').should == true
      selector_cell_present?('S3').should == true
      selector_cell_present?('S4').should == true
      selector_cell_present?('S5').should == true
      selector_cell_present?('CX').should == true

      click_selector_cell('select_gateway_s1')
      get_selector_cell_text('selected_phase_1_gateway_1').should == 'S1'




      get_selector_cell_text('selected_phase_1_gateway_2').should == ''
      click_selector_cell('selected_phase_1_gateway_2')

      selector_cell_present?('S1').should == false
      selector_cell_present?('S2').should == true
      selector_cell_present?('S3').should == true
      selector_cell_present?('S4').should == true
      selector_cell_present?('S5').should == true
      selector_cell_present?('CX').should == true
      selector_cell_present?('APEX').should == true

      click_selector_cell('select_gateway_apex')
      get_selector_cell_text('selected_phase_1_gateway_2').should == 'APEX'


  
      get_selector_cell_text('selected_phase_1_direction').should == 'L/B'
    
      
      
      get_selector_cell_text('selected_phase_1_level_of_care').should == ''
      click_selector_cell('selected_phase_1_level_of_care')
      
      selector_cell_present?('1A').should == true
      selector_cell_present?('1B').should == true
      selector_cell_present?('1C').should == true
      selector_cell_present?('2A').should == true
      selector_cell_present?('2B').should == true
      selector_cell_present?('2C').should == true
      selector_cell_present?('3A').should == true
      selector_cell_present?('3B').should == true
      selector_cell_present?('3C').should == true
      selector_cell_present?('4').should == true
      
      click_selector_cell('select_level_of_care_3A')
      get_selector_cell_text('selected_phase_1_level_of_care').should == '3A'
      
    end
    
  
    # move this to travel card
    scenario "travel card shows the right gateways with the right coloring" do 
    
    end
  
    scenario "if this practice member has a visit already today then show it, otherwise just show the new visit button" do
    
    end
  
    scenario "the mini-travel card should show the right gateways with the right coloring" do
    
    end
  
    scenario "the mini-travel card should highlight available gateways when a phase is selected for Phase 1" do
    
    end
  
    scenario "the mini-travel card should highlight available gateways when a phase is selected for Phase 2" do
    
    end
  
    scenario "values for Phase 1 can be set and autosave" do
    
    end
  
    scenario "values for Phase 2 can be set and autosave" do
    
    end
  
    scenario "values for Tension can be set and autosave" do
    
    end
  
    scenario "values for Advanced/Misc can be set and autosave" do
    
    end
  
    scenario "values for SRI can be set and autosave" do
    
    end
  
    scenario "values for Diagnosis and Notes can be set and autosave" do
    
    end
  
    scenario "I can change the date of a visit" do
    
    end
  
    scenario "I can delete a visit" do
    
    end
  
    scenario "I can see the Visit List" do
    
    end
  
    scenario "The Visit List refreshes when accessed to show even the newest Visit" do
    
    end 
  
    scenario "When I select a visit from the Visit List it shows in the Visit section" do
    
    end
    
  end

  
end
