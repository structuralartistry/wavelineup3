require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "New Practice Member and Find dialog feature", %q{
  In order to ...
  As a ...
  I want to ...
} do

  context "dialogs" do

    before(:each) do
      logged_in_as_role_for_practice(:practice_admin_user, "StructuralArtistry practice")
      @practice_member_name_one = "Kahn, David N"
      @practice_member_name_two = "Apple, Johnny R"
      create_practice_member("Kahn, David N", "StructuralArtistry practice")
      create_practice_member("Apple, Johnny R", "StructuralArtistry practice")
      visit('/home')
    end

    context "New Practice Member and Find dialog operations", :js => true do

      scenario "New Practice Member, Find, Lineup and Feedback Support dialogs show, hide and cancel eachother" do

        click_selector_cell('New PM')
        new_practice_member_dialog_present?.should == true
        find_dialog_present?.should == false
        feedback_support_dialog_present?.should == false
        lineup_dialog_present?.should == false

        click_selector_cell('Find')
        new_practice_member_dialog_present?.should == false
        find_dialog_present?.should == true
        feedback_support_dialog_present?.should == false
        lineup_dialog_present?.should == false

        click_selector_cell('Feedback/Support')
        new_practice_member_dialog_present?.should == false
        find_dialog_present?.should == false
        feedback_support_dialog_present?.should == true
        lineup_dialog_present?.should == false

        selector_cell_present?('Lineup').should == false
        click_selector_cell('Find')
        click_selector_cell(@practice_member_name_one)
        selector_cell_present?('Lineup').should == true
        click_selector_cell('Lineup')
        new_practice_member_dialog_present?.should == false
        find_dialog_present?.should == false
        feedback_support_dialog_present?.should == false
        lineup_dialog_present?.should == true
        selector_cell_present?(@practice_member_name_one)

        click_selector_cell('New PM')
        new_practice_member_dialog_present?.should == true
        find_dialog_present?.should == false
        feedback_support_dialog_present?.should == false
        lineup_dialog_present?.should == false
      end

      scenario "I can click on the 'K' alphabet key and only see practice members whose last name starts with 'K'" do
        click_selector_cell('Find')
        assert selector_cell_present?(@practice_member_name_one)
        assert selector_cell_present?(@practice_member_name_two)
        click_selector_cell('K')
        assert selector_cell_present?(@practice_member_name_one)
        assert !selector_cell_present?(@practice_member_name_two)
      end

      scenario "Find dialog page selectors toggle correctly" do
        click_selector_cell('Find')

        page_selectors = ['Visit', 'Travel Card', 'Visit List', 'Personal Info']
        page_selectors.each do |page_selector_cell|
          click_selector_cell(page_selector_cell)
          selector_cell_selected?(page_selector_cell).should == true
          filtered_page_selectors = ['Visit', 'Travel Card', 'Visit List', 'Personal Info']
          filtered_page_selectors.delete(page_selector_cell)
          filtered_page_selectors.each {|selector| selector_cell_selected?(selector).should == false}
        end
      end

      scenario "Find dialog navigation" do
        click_selector_cell('Find')
        click_selector_cell(@practice_member_name_one)
        confirm_visit_loaded

        click_selector_cell('Find')
        click_selector_cell('Travel Card')
        click_selector_cell(@practice_member_name_one)
        has_text?('Kahn, David N', 'h1')
        confirm_travel_card_loaded

        click_selector_cell('Find')
        click_selector_cell('Visit List')
        click_selector_cell(@practice_member_name_one)
        has_text?('No Visits on record for this Practice Member').should == true

        click_selector_cell('Find')
        click_selector_cell('Personal Info')
        click_selector_cell(@practice_member_name_one)
        assert has_text?('Edit Practice Member', 'h1')
      end

      scenario "Feedback and Support dialog operations", :js => true do
        visit('/home')
        has_text?('Let us know how it is going or if you need some help!').should == false
        selector_cell_selected?('Feedback/Support').should == false
        click_selector_cell('Feedback/Support')
        selector_cell_selected?('Feedback/Support').should == true

        has_text?('Feedback & Support', 'h1').should == true
        fill_in('Let us know how it is going or if you need some help!', :with => 'A comment provided')
        click_selector_cell('Send')

        has_text?('Thanks for your message. We will respond promptly!', 'p')

        selector_cell_present?('New PM').should == true # page gets reinitialized to reset the form and the send button as a selector cell, so make sure these are present
        selector_cell_present?('Find').should == true
        selector_cell_present?('Feedback/Support').should == true
      end

    end

    context "Lineup selector functionality and operations", :js => true do

      scenario "any practice member accessed in the practice room is added to the lineup selector, no lineup selector if no PM's have been selected" do
        lineup_dialog_present?.should == false

        click_selector_cell('Find')
        click_selector_cell(@practice_member_name_one)
        confirm_visit_loaded
        selector_cell_present?('Lineup').should == true
        click_selector_cell('Lineup')
        assert selector_cell_present?(@practice_member_name_one)
      end

      scenario "the lineup selector removes the practice member if they have not been accessed within the lineup time threshold" do
        # access a PM
        click_selector_cell('Find')
        click_selector_cell(@practice_member_name_one)
        click_selector_cell('Find')
        click_selector_cell(@practice_member_name_two)

        selector_cell_present?('Lineup').should == true
        click_selector_cell('Lineup')

        selector_cell_present?(@practice_member_name_one).should == true
        selector_cell_present?(@practice_member_name_two).should == true

        # set the date of access before threshold for pm 1
        practice_member = PracticeMember.find_by_last_name(@practice_member_name_one.split(/ /)[0].gsub(',',''))
        practice_member.last_practice_room_access = DateTime.now-(LINEUP_DURATION_OF_STAY_MINUTES+2).minutes
        practice_member.save

        # check that is no longer in the selector
        visit('/home')
        selector_cell_present?('Lineup').should == true
        click_selector_cell('Lineup')

        selector_cell_present?(@practice_member_name_one).should == false
        selector_cell_present?(@practice_member_name_two).should == true

        # set the date of access before threshold for pm 2
        practice_member = PracticeMember.find_by_last_name(@practice_member_name_two.split(/ /)[0].gsub(',',''))
        practice_member.last_practice_room_access = DateTime.now-(LINEUP_DURATION_OF_STAY_MINUTES+2).minutes
        practice_member.save

        # now lineup should be gone as both pm's are out of scope
        visit('/home')
        selector_cell_present?('Lineup').should == false
      end

    end

    scenario "the Find and Lineup selector cells do not show if there are no practice members", :js => true do
      PracticeMember.delete_all
      visit('/home')

      selector_cell_present?('Find').should == false
      selector_cell_present?('Lineup').should == false
    end

  end

end
