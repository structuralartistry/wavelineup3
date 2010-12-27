require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Practice Room Feature", %q{
} do
  
  before(:each) do
    practice_name = 'StructuralArtistry practice'
    logged_in_as_role_for_practice(:practice_user, practice_name)
    @practice_member = create_practice_member('Kahn, David Nathan', practice_name)
  end
    
  scenario "when I go to the practice_room/visit I see the visit area" do
    visit("/practice_room/#{@practice_member.id}/visit")
    has_text?("visit for #{@practice_member.full_name_last_comma_first_middle_initial}").should == true
  end
  
  scenario "when I go to practice_room/travel_card I see the travel card" do
    visit("/practice_room/#{@practice_member.id}/travel_card")
    has_text?('Kahn, David N', 'h1')
    confirm_travel_card_loaded
  end
  
  scenario "when I go to practice_room/visit_list I see the visit list" do
    visit("/practice_room/#{@practice_member.id}/visit_list")
    has_text?("visit list for #{@practice_member.full_name_last_comma_first_middle_initial}").should == true
  end
  
  scenario "bad visible_section param rejected" do
    visit("/practice_room/#{@practice_member.id}/boohoo")
    has_flash_notice?('The requested action was invalid').should == true
  end
  
  scenario "the practice room selector at top of page allows toggle between Visit, Travel Card and Visit List", :js => true do 
    visit("/practice_room/#{@practice_member.id}/visit")

    selector_cell_present?('V').should == true
    selector_cell_present?('TC').should == true
    selector_cell_present?('VL').should == true
    selector_cell_selected?('V').should == true
    selector_cell_selected?('TC').should == false
    selector_cell_selected?('VL').should == false
    confirm_visit_loaded
    
    click_selector_cell('TC')
    selector_cell_selected?('V').should == false
    selector_cell_selected?('TC').should == true
    selector_cell_selected?('VL').should == false
    confirm_travel_card_loaded
    
    click_selector_cell('VL')
    selector_cell_selected?('V').should == false
    selector_cell_selected?('TC').should == false
    selector_cell_selected?('VL').should == true
    confirm_visit_list_loaded
    
    click_selector_cell('V')
    selector_cell_selected?('V').should == true
    selector_cell_selected?('TC').should == false
    selector_cell_selected?('VL').should == false
    confirm_visit_loaded
  end
  
end
