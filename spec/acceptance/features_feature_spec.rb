require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Features Feature", %q{
} do

  context "show features section on home page" do

    scenario "home page should not show System section if no new features added in last 7 days" do
      Factory(:feature_request)
      practice = logged_in_as_role(:practice_admin_user)
      visit('/home')

      has_text?('Recent Updates', 'td').should == false
    end

    scenario "home page should not show System section and features if no new features added in last 7 days" do
      logged_in_as_role(:practice_admin_user)
      Factory(:feature_request_implemented)
      visit('/home')

      has_text?('Recent Updates', 'td').should == true
    end

  end

  it "should show the features list page of all implemented and requested features" do
      Factory(:feature_request)
      Factory(:feature_request_implemented)
      logged_in_as_role(:practice_admin_user)
      Factory(:feature_request_implemented)
      visit('/home')

      click_link('Feature Requests List')
  end

  it "should have a navegable link to the features page" do
    logged_in_as_role(:practice_admin_user)
    Factory(:feature_request)
    Factory(:feature_request_implemented)
    visit('/home')

    click_link('Feature Requests List')
    page.has_content?('Features Added').should == true
    page.has_content?('Feature Requests').should == true
  end

end
