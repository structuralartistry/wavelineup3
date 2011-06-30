require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Practice Management Feature", %q{
  In order to ...
  As a ...
  I want to ...
} do

  context "practice admin user", :js => true do

    before(:each) do
      @practice = logged_in_as_role_for_practice(:practice_admin_user, "StructuralArtistry practice")
      @logged_in_user = @practice.users[0]
      visit('/home')
    end

    scenario "I can change my practice" do
      title_contains?(@practice.name)
      click_selector_cell('Edit Practice')

      has_text?('Manage Practice', 'h1').should == true
      has_text?('Practice name', 'label').should == true
      has_text?('Practice Users', 'td').should == true
      has_text?('Time zone', 'label').should == true
      has_text?(@practice.users[0].email).should == true

      new_practice_name = 'New Practice Name'
      fill_in('Practice name', :with => new_practice_name)
      select('Eastern Time (US & Canada)', :from => 'Time zone')
      click_selector_cell('Submit')

      has_flash_notice?('Practice was successfully updated').should == true
      title_contains?(new_practice_name)
    end

    scenario "I can delete my practice" do
      click_selector_cell('Edit Practice')
      selector_cell_present?('Delete Practice').should == true
      click_selector_cell('Delete Practice')

      has_text?('Confirm Practice Deletion', 'h1').should == true
      has_text?('Please confirm that you wish to delete your practice.').should == true
      has_text?('All Practice Members, Travel Cards and Visits will be deleted permanently.').should == true
      selector_cell_present?('Delete Practice').should == true
      selector_cell_present?('Cancel').should == true

      click_selector_cell('Cancel')

      has_text?('Manage Practice', 'h1').should == true

      click_selector_cell('Delete Practice')
      click_selector_cell('Delete Practice')

      confirm_login_page_loaded

      Practice.count.should == 0
    end

    scenario "I can export my practice data including practice members with travel card and visit information to xml" do
      click_selector_cell('Edit Practice')

      selector_cell_present?('Export Practice Data').should == true

      click_selector_cell('Export Practice Data')
    end

  end

end
