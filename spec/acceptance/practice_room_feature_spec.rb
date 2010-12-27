require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Practice Room Feature", %q{
} do
  
  before(:each) do
    practice_name = 'StructuralArtistry practice'
    logged_in_as_role_for_practice(:practice_user, practice_name)
    @practice_member = create_practice_member('Kahn, David Nathan', practice_name)
  end
  
  scenario "when I go to practice_room/travel_card I see the travel card" do
    visit("/practice_room/#{@practice_member.id}/travel_card")
    has_text?('Kahn, David N', 'h1')
    confirm_travel_card_loaded
  end
  
  scenario "when I go to practice_room/visit_list I see the visit list" do
    visit("/practice_room/#{@practice_member.id}/visits")
    has_text?("visits for #{@practice_member.full_name_last_comma_first_middle_initial}").should == true
  end
  
  scenario "when I go to the practice_room/visits I see the visit area" do
    visit("/practice_room/#{@practice_member.id}/visit")
    has_text?("visit for #{@practice_member.full_name_last_comma_first_middle_initial}").should == true
  end
  
  scenario "bad visible_section param rejected" do
    visit("/practice_room/#{@practice_member.id}/boohoo")
    has_flash_notice?('The requested action was invalid').should == true
  end
  
  
  

  
end
