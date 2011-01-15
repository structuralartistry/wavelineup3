require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Visit List Feature", %q{

} do
  
  context "visit list functionality", :visit_list => true, :js => true do
    
    before(:each) do
      practice_name = 'StructuralArtistry practice'
      logged_in_as_role_for_practice(:practice_user, practice_name)
      @practice_member = create_practice_member('Kahn, David Nathan', practice_name)
      @practice_room_visit_list_page = "/practice_room/#{@practice_member.id}/visit_list" 
    end

    scenario "the visit list shows the date, phase 1, 2 and sri stage of all visits for the selected practice member" do
      visit(@practice_room_visit_list_page) 

      # no visits
      has_text?('No Visits on record for this Practice Member').should == true
      has_text?('Date', 'td').should == false
      has_text?('Phase 1', 'td').should == false
      has_text?('Phase 2', 'td').should == false
      has_text?('SRI Stage', 'td').should == false
      has_text?('2010-01-01', 'td').should == false
      has_text?('3', 'td').should == false
      has_text?('5', 'td').should == false
      has_text?('6', 'td').should == false
      
      visit = Factory.create(:visit)
      visit.practice_member_id = @practice_member.id
      visit.entrainment_date = '2010-01-01'
      visit.phase_1 = '3'
      visit.phase_2 = '5'
      visit.sri_stage = '6'
      visit.save
      
      visit(@practice_room_visit_list_page) 
      
      has_text?('Date', 'td').should == true
      has_text?('Phase 1', 'td').should == true
      has_text?('Phase 2', 'td').should == true
      has_text?('SRI Stage', 'td').should == true
      
      has_text?('2010-01-01', 'td').should == true
      has_text?('3', 'td').should == true
      has_text?('5', 'td').should == true
      has_text?('6', 'td').should == true
      
      visit = Factory.create(:visit)
      visit.practice_member_id = visit.id
      visit.entrainment_date = '2011-01-01'
      visit.phase_1 = '1 > 2 C5'
      visit.phase_2 = '4'
      visit.sri_stage = '9'
      visit.save
      
      visit(@practice_room_visit_list_page)
      
      has_text?('2010-01-01', 'td').should == true
      has_text?('3', 'td').should == true
      has_text?('5', 'td').should == true
      has_text?('6', 'td').should == true
    end

    scenario "when I click on a visit in the visit list, the visit loads into the visit view", :js => true do
      visit = Factory.create(:visit)
      visit.practice_member_id = @practice_member.id
      visit.entrainment_date = '2010-01-01'
      visit.phase_1 = '3'
      visit.phase_2 = '5'
      visit.sri_stage = '6'
      visit.save
      
      visit(@practice_room_visit_list_page) 
      
      click_selector_cell("#{visit.id}")
      
      verify_visit_loaded(visit.id)
    end

  end

end
