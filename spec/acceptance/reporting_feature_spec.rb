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
    selector_cell_selected?('Today').should == true

    click_selector_cell('Submit')

    has_text?('Report', 'h1').should == true
  end

  scenario "should be able to filter report by a specific practice member", :js => true do
    practice_member = Factory(:practice_member, :practice => @practice)
    visit = Factory(:visit, :practice_member => practice_member, :date => DateTime.now)

    # create another which should not return on report
    Factory(:practice_member, :practice => Factory(:practice_two))

    visit('/reports')

    practice_member_selector_present?.should eq(false)
    click_selector_cell('Individual')
    generic_practice_member_selector_present?.should eq(true)
    has_text?('Select Target Page').should eq(false)

    click_selector_cell(practice_member.full_name)
    has_text?('Individual','td').should eq(false)
    has_text?(practice_member.full_name,'td').should eq(true)

    click_selector_cell('Submit')

    has_text?("Practice Member filter: #{practice_member.full_name.upcase}", 'p').should == true
    has_text?("1 Visit records returned for 1 Practice Members", 'p').should == true
    has_text?(visit.phase_1, 'td').should == true

    # test non-existant filter for pm
    visit("/reports/show?filter_practice_member=#{practice_member.id.succ}&lookback_days=1")
    has_text?("Practice Member filter: ", 'p').should == true
    has_text?("0 Visit records returned for 0 Practice Members", 'p').should == true
    has_text?(visit.phase_1, 'td').should == false
  end

  scenario "current selected should toggle correctly for practice member filter", :js => true do
    practice_member = Factory(:practice_member, :practice => @practice)
    visit = Factory(:visit, :practice_member => practice_member)

    visit('/reports')
    selector_cell_selected?('All').should eq(true)
    selector_cell_selected?('Individual').should eq(false)
    click_selector_cell('Individual')
    click_selector_cell(practice_member.full_name)
    selector_cell_selected?(practice_member.full_name).should eq(true)
    selector_cell_selected?('All').should eq(false)
    click_selector_cell('All')
    selector_cell_selected?('All').should eq(true)
    selector_cell_selected?(practice_member.full_name).should eq(false)
  end

  scenario "current selected for lookback period should toggle correctly", :js => true do
    visit('/reports')
    selector_cell_selected?('Today').should eq(true)
    selector_cell_selected?('1 Day').should eq(false)
    selector_cell_selected?('7 Days').should eq(false)
    selector_cell_selected?('30 Days').should eq(false)
    selector_cell_selected?('60 Days').should eq(false)
    selector_cell_selected?('90 Days').should eq(false)

    click_selector_cell('30 Days')

    selector_cell_selected?('Today').should eq(false)
    selector_cell_selected?('1 Day').should eq(false)
    selector_cell_selected?('7 Days').should eq(false)
    selector_cell_selected?('30 Days').should eq(true)
    selector_cell_selected?('60 Days').should eq(false)
    selector_cell_selected?('90 Days').should eq(false)

    click_selector_cell('1 Day')

    selector_cell_selected?('Today').should eq(false)
    selector_cell_selected?('1 Day').should eq(true)
    selector_cell_selected?('7 Days').should eq(false)
    selector_cell_selected?('30 Days').should eq(false)
    selector_cell_selected?('60 Days').should eq(false)
    selector_cell_selected?('90 Days').should eq(false)
  end

  scenario "should be able to filter report by date range", :js => true do
    practice_member = Factory(:practice_member, :practice => @practice)
    visit = Factory(:visit, :practice_member => practice_member, :date => DateTime.now)
    visit = Factory(:visit, :practice_member => practice_member, :date => DateTime.now-1.day)
    visit = Factory(:visit, :practice_member => practice_member, :date => DateTime.now-10.days)
    visit = Factory(:visit, :practice_member => practice_member, :date => DateTime.now-35.days)
    visit = Factory(:visit, :practice_member => practice_member, :date => DateTime.now-65.days)

    visit('/reports')

    click_selector_cell('30 Days')
    click_selector_cell('Submit')

    has_text?("3 Visit records returned for 1 Practice Members", 'p').should == true
  end

  scenario "should be able to just show todays visits", :js => true do
    practice_member = Factory(:practice_member, :practice => @practice)
    visit = Factory(:visit, :practice_member => practice_member, :date => DateTime.now)
    visit = Factory(:visit, :practice_member => practice_member, :date => DateTime.now-1.day)

    visit('/reports')

    click_selector_cell('Submit')

    has_text?("1 Visit records returned for 1 Practice Members", 'p').should == true
  end

  scenario "it should show the correct fields for a visit on the report" do
    practice_member = Factory(:practice_member, :practice => @practice)
    visit = Factory(:visit, :practice_member => practice_member, :date => DateTime.now)
    visit('/reports/show?filter_practice_member=all&lookback_days=1')

    page.has_content?('Report for time period').should == true
    page.has_content?('Practice Member filter').should == true
    page.has_content?('Visit records returned for').should == true

    # spot check visit
    has_text?(visit.phase_1, 'td').should == true
    has_text?(visit.phase_2, 'td').should == true
    has_text?(visit.notes, 'td').should == true
  end

end


