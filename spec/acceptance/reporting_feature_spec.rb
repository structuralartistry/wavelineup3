require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Reporting Feature", %q{
} do

  before(:each) do
    logged_in_as_role(:practice_admin_user)
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

    has_selector_cell?('All Practice Members').should == true
    has_selector_cell?('All Dates').should == true
    has_selector_cell?('Submit').should == true
  end

  scenario "should be able to filter report by all practice members and all dates (default on page load)" do
    selector_cell_selected?('All Practice Members').should == true
    selector_cell_selected?('All Dates').should == true
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
pending
  end

  scenario "should be able to include the travel card data in the report" do
pending
  end

  scenario "it should have links to and be able to render preset report 'Visits Past 24 Hours'" do
pending
  end

  scenario "it should have links to and be able to render preset report 'Visits Past 30 Days'" do
pending
  end

  scenario "on the report there should be a button to Print" do
pending
  end

  scenario "on the report there should be a button to Export the report" do
pending
  end

end


