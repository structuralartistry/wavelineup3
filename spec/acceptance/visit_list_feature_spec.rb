require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Visit List Feature", %q{

} do

  context "visit list functionality", :js => true do

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
      has_text?('1st Phase', 'td').should == false
      has_text?('LOC', 'td').should == false
      has_text?('Dir', 'td').should == false
      has_text?('2nd Phase', 'td').should == false
      has_text?('SRI Stage', 'td').should == false
      has_text?('2010-01-01', 'td').should == false
      has_text?('3', 'td').should == false
      has_text?('5', 'td').should == false
      has_text?('6', 'td').should == false

      visit = Factory.build(:visit)
      visit.practice_member_id = @practice_member.id
      visit.date = Time.zone.now
      visit.phase_1 = '3'
      visit.phase_2 = '5'
      visit.sri_stage = '6'
      visit.save!

      visit(@practice_room_visit_list_page)

      has_text?('Date', 'td').should == true
      has_text?('1st Phase', 'td').should == true
      has_text?('LOC', 'td').should == true
      has_text?('Dir', 'td').should == true
      has_text?('2nd Phase', 'td').should == true
      has_text?('SRI Stage', 'td').should == true
      has_text?('2010-01-01 00:00', 'td').should == true
      has_text?('3', 'td').should == true
      has_text?('5', 'td').should == true
      has_text?('6', 'td').should == true

      visit = Factory.build(:visit)
      visit.practice_member_id = visit.id
      visit.date = Time.zone.now
      visit.phase_1 = '1 > 2 C5'
      visit.phase_2 = '4'
      visit.sri_stage = '9'
      visit.save

      visit(@practice_room_visit_list_page)

      has_text?(Time.zone.now, 'td').should == true
      has_text?('3', 'td').should == true
      has_text?('5', 'td').should == true
      has_text?('6', 'td').should == true
    end

    scenario "when I click on a visit in the visit list, the visit loads into the visit view", :js => true do
      visit = Factory.create(:visit)
      visit.practice_member_id = @practice_member.id
      visit.date = '2010-01-01'
      visit.phase_1 = '3'
      visit.phase_2 = '5'
      visit.sri_stage = '6'
      visit.save

      visit(@practice_room_visit_list_page)

      click_selector_cell("#{visit.id}")

      verify_visit_loaded(visit.id)
    end

    scenario "clicking 'Show Notes'/'Hide Notes' toggles the notes for each visit on the visit list" do
      visit = Factory(:visit, :practice_member => @practice_member)

      visit(@practice_room_visit_list_page)
      page.has_content?(visit.notes).should eq(false)
      selector_cell_present?('More').should == true
      selector_cell_selected?('More').should == false

      click_selector_cell('More')
      selector_cell_selected?('More').should == true
      page.has_content?(visit.notes).should eq(true)

      click_selector_cell('More')
      selector_cell_selected?('More').should == false
      page.has_content?(visit.notes).should eq(false)
    end

  end

end
