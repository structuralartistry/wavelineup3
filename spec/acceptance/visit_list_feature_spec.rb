require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Visit List Feature", %q{

} do

  context "visit list functionality", :js => true do

    before(:each) do
      practice_name = 'StructuralArtistry practice'
      logged_in_as_role_for_practice(:practice_user, practice_name)
      @practice_member = create_practice_member('Kahn, David Nathan', practice_name)
      @practice_room_page = "/practice_room/#{@practice_member.id}/visit"
    end

    scenario "the visit list shows the date, phase 1, 2 and sri stage of all visits for the selected practice member" do
      visit(@practice_room_page)
      click_selector_cell('Visit List')

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
      now = DateTime.now
      visit.date = now
      visit.phase_1 = '3'
      visit.phase_2 = '5'
      visit.sri_stage = '6'
      visit.save!

      visit(@practice_room_page)
      click_selector_cell('Visit List')

      has_text?('Date', 'td').should == true
      has_text?('1st Phase', 'td').should == true
      has_text?('LOC', 'td').should == true
      has_text?('Dir', 'td').should == true
      has_text?('2nd Phase', 'td').should == true
      has_text?('SRI Stage', 'td').should == true
      has_text?(now.strftime('%Y-%m-%d %H:%M'), 'td').should == true
      has_text?('3', 'td').should == true
      has_text?('5', 'td').should == true
      has_text?('6', 'td').should == true

      visit = Factory.build(:visit)
      visit.practice_member_id = visit.id
      now = DateTime.now
      visit.date = now
      visit.phase_1 = '1 > 2 C5'
      visit.phase_2 = '4'
      visit.sri_stage = '9'
      visit.save

      visit(@practice_room_page)
      click_selector_cell('Visit List')

      has_text?(now.strftime('%Y-%m-%d %H:%M'), 'td').should == true
      has_text?('3', 'td').should == true
      has_text?('5', 'td').should == true
      has_text?('6', 'td').should == true
    end

    scenario "when I click on a visit in the visit list, the visit loads into the visit view", :js => true do
      visit = Factory.create(:visit)
      visit.practice_member_id = @practice_member.id
      visit.date = Time.zone.now
      visit.phase_1 = '3'
      visit.phase_2 = '5'
      visit.sri_stage = '6'
      visit.save

      visit(@practice_room_page)
      click_selector_cell('Visit List')

      click_selector_cell("#{visit.id}")

      verify_visit_loaded(visit.id)
    end

    scenario "clicking 'More' toggles the notes for each visit on the visit list", :js => true do
      # cant get Capybara to correctly test notes showing/hiding... so just testing that they are present
      # in what I can bet to pass - non-passing lines commented in this test

      visit = Factory(:visit, :practice_member => @practice_member, :date => DateTime.now-1.day)

      visit(@practice_room_page)
      click_selector_cell('Visit List')

      has_text?(visit.notes, 'span').should eq(false)
      selector_cell_present?('More').should == true
      selector_cell_selected?('More').should == false

      click_selector_cell('More')

      selector_cell_selected?('More').should == true
      has_text?(visit.notes, 'span').should eq(true)


      click_selector_cell('More')
      selector_cell_selected?('More').should == false
      has_text?(visit.notes, 'span').should eq(false)
    end

  end

end
