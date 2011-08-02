require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Reporting Feature", %q{
} do

  before(:each) do
    @practice = logged_in_as_role_for_practice(:practice_admin_user, 'Practice One')
  end

  scenario "the Reporting button should be in the left column" do
    visit('/home')
    selector_cell_present?('Reports').should == true
  end

  scenario "the Reporting main index should load when clicking on the Reporting button" do
    visit('/home')
    click_selector_cell('Reports')
    current_path.should =~ /reports/
    has_text?('Reports', 'h1').should == true

    selector_cell_present?('All').should == true
    selector_cell_present?('Individual').should == true

    selector_cell_present?('1 Day').should == true
    selector_cell_present?('7 Days').should == true
    selector_cell_present?('30 Days').should == true
    selector_cell_present?('60 Days').should == true
    selector_cell_present?('90 Days').should == true

    selector_cell_present?('Submit').should == true
  end

  scenario "should be able to filter report by all practice members and all dates (default on page load)", :js => true do
    visit('/reports')

    selector_cell_selected?('All').should == true
    selector_cell_selected?('1 Day').should == true

    click_selector_cell('Submit')

    has_text?('Report', 'h1').should == true
  end

  scenario "should be able to filter report by a specific practice member" do
pending
    visit('/reports')
  end

  scenario "the selected practice member should be the currently selected practice member in the practice room" do
    pending 'maybe not do this....'
  end

  scenario "should be able to filter report by date range" do
pending
  end

  scenario "it should show the correct fields for a visit on the report" do
    practice_member = Factory(:practice_member, :practice => @practice)
    Factory(:visit, :practice_member => practice_member)
    visit('/reports/show/filter_practice_members=all&lookback_days=1')
has_text?('need to complete this test')
  end

  scenario "should be able to include the travel card data in the report" do
pending
  end

  scenario "on the report there should be a button to Print" do
pending
  end

  scenario "on the report there should be a button to Export the report" do
pending
  end

end


