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

      click_selector_cell("visit_#{visit.id}")

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

    context "it paginates the visits", :js => true do

      before(:each) do
        unique_number = 1
        20.times { Factory(:visit, :practice_member => @practice_member, :sri_stage => "testing_token_#{unique_number}"); unique_number+=1; }
      end

      it "should show the pagination selector" do
        visit(@practice_room_page)
        click_selector_cell('Visit List')

        selector_cell_present?('First').should eq(false)
        selector_cell_present?('Prev').should eq(false)
        selector_cell_present?('1').should eq(true)
        selector_cell_present?('2').should eq(true)
        selector_cell_present?('3').should eq(true)
        selector_cell_present?('4').should eq(false) # should only be 3 paginated pages
        selector_cell_present?('5').should eq(false) # should only be 3 paginated pages
        selector_cell_present?('Next').should eq(true)
        selector_cell_present?('Last').should eq(true)

        click_selector_cell('2')

        selector_cell_present?('First').should eq(true)
        selector_cell_present?('Prev').should eq(true)
        selector_cell_present?('1').should eq(true)
        selector_cell_present?('2').should eq(true)
        selector_cell_present?('3').should eq(true)
        selector_cell_present?('4').should eq(false) # should only be 3 paginated pages
        selector_cell_present?('5').should eq(false) # should only be 3 paginated pages
        selector_cell_present?('Next').should eq(true)
        selector_cell_present?('Last').should eq(true)
      end

      it "should show the current paginated page in the selector" do
        visit(@practice_room_page)
        click_selector_cell('Visit List')

        selector_cell_selected?('1').should eq(true)
        selector_cell_selected?('3').should eq(false)

        click_selector_cell('3')

        selector_cell_selected?('1').should eq(false)
        selector_cell_selected?('3').should eq(true)
      end

      it "should by default show the first paginated visits page containing 7 records" do
        visit(@practice_room_page)
        click_selector_cell('Visit List')

        has_text?('testing_token_1', 'td').should eq(true)
        has_text?('testing_token_2', 'td').should eq(true)
        has_text?('testing_token_3', 'td').should eq(true)
        has_text?('testing_token_4', 'td').should eq(true)
        has_text?('testing_token_5', 'td').should eq(true)
        has_text?('testing_token_6', 'td').should eq(true)
        has_text?('testing_token_7', 'td').should eq(true)
        has_text?('testing_token_8', 'td').should eq(false)
        has_text?('testing_token_9', 'td').should eq(false)
        has_text?('testing_token_10', 'td').should eq(false)
        has_text?('testing_token_11', 'td').should eq(false)
        has_text?('testing_token_12', 'td').should eq(false)
        has_text?('testing_token_13', 'td').should eq(false)
        has_text?('testing_token_14', 'td').should eq(false)
        has_text?('testing_token_15', 'td').should eq(false)
        has_text?('testing_token_16', 'td').should eq(false)
      end

      it "should get the second paginated visit page of 7 records" do
        visit(@practice_room_page)
        click_selector_cell('Visit List')

        click_selector_cell('2')

        has_text?('testing_token_1', 'td').should eq(false)
        has_text?('testing_token_2', 'td').should eq(false)
        has_text?('testing_token_3', 'td').should eq(false)
        has_text?('testing_token_4', 'td').should eq(false)
        has_text?('testing_token_5', 'td').should eq(false)
        has_text?('testing_token_6', 'td').should eq(false)
        has_text?('testing_token_7', 'td').should eq(false)
        has_text?('testing_token_8', 'td').should eq(true)
        has_text?('testing_token_9', 'td').should eq(true)
        has_text?('testing_token_10', 'td').should eq(true)
        has_text?('testing_token_11', 'td').should eq(true)
        has_text?('testing_token_12', 'td').should eq(true)
        has_text?('testing_token_13', 'td').should eq(true)
        has_text?('testing_token_14', 'td').should eq(true)
        has_text?('testing_token_15', 'td').should eq(false)
        has_text?('testing_token_16', 'td').should eq(false)
      end

      it "should get the last paginated visit page" do
        visit(@practice_room_page)
        click_selector_cell('Visit List')

        click_selector_cell('Last')

        has_text?('testing_token_1', 'td').should eq(false)
        has_text?('testing_token_2', 'td').should eq(false)
        has_text?('testing_token_3', 'td').should eq(false)
        has_text?('testing_token_4', 'td').should eq(false)
        has_text?('testing_token_5', 'td').should eq(false)
        has_text?('testing_token_6', 'td').should eq(false)
        has_text?('testing_token_7', 'td').should eq(false)
        has_text?('testing_token_8', 'td').should eq(false)
        has_text?('testing_token_9', 'td').should eq(false)
        has_text?('testing_token_10', 'td').should eq(false)
        has_text?('testing_token_11', 'td').should eq(false)
        has_text?('testing_token_12', 'td').should eq(false)
        has_text?('testing_token_13', 'td').should eq(false)
        has_text?('testing_token_14', 'td').should eq(false)
        has_text?('testing_token_15', 'td').should eq(true)
        has_text?('testing_token_16', 'td').should eq(true)
      end

    end

  end

end
