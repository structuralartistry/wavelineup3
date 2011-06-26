require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Home Page Feature", %q{
  In order to use Wavelineup
  As a user
  I want to see the home page
  This page will show me the login form if I am not logged in
  And it will show me that I am logged in if I am logged in
} do

  context "access rights and basic page load" do

    scenario "Home page when not logged in" do
      visit('/home')
      confirm_login_page_loaded
      title_contains?("WaveLineup").should == true
    end

    scenario "Home page logged in as sysadmin" do
      practice = logged_in_as_role(:sysadmin_user)
      visit('/home')
      confirm_home_page_loaded
      title_contains?("WaveLineup ::: #{practice.name} ::: #{practice.users[0].email}")
    end

    scenario "Home page logged in as a practice admin user" do
      practice = logged_in_as_role(:practice_admin_user)
      visit('/home')
      confirm_home_page_loaded
      title_contains?("WaveLineup ::: #{practice.name} ::: #{practice.users[0].email}")
    end

    scenario "Home page logged in as a practice user" do
      practice = logged_in_as_role(:practice_user)
      visit('/home')
      confirm_home_page_loaded
      title_contains?("WaveLineup ::: #{practice.name} ::: #{practice.users[0].email}")
    end

  end

  scenario "(prospective) user can view the Terms of Service" do
    visit('/terms_of_service')
    has_text?('WaveLineup Terms of Service').should == true
    has_content?('StructuralArtistry reserves the right to update and change the Terms of Service from time to time without notice').should == true
  end

  scenario "(prospective) user can view Privacy Policy" do
    visit('/privacy_policy')
    has_text?('WaveLineup Privacy Policy').should == true
    has_content?('We collect the e-mail addresses of those who communicate with us').should == true
  end

  scenario "Send an invitation to another Practitioner", :js => true do
    practice_name = 'SA Practice'
    logged_in_as_role_for_practice(:practice_user, practice_name)
    create_practice_member("Kahn, David N", practice_name)
    visit('/home')
    invitee_email = 'practitioner@gmail.com'
    fill_in("Email", :with => invitee_email)
    click_selector_cell('Send!')

    has_text?("An invite has been sent to #{invitee_email}", 'p')
    selector_cell_present?('New PM').should == true # page gets reinitialized to reset the form and the send button as a selector cell, so make sure these are present
    selector_cell_present?('Find').should == true
    selector_cell_present?('Feedback/Support').should == true
  end

  context "should have footer information" do

    before(:each) do
      practice = logged_in_as_role(:practice_admin_user)
      visit('/home')
    end

    it "should be able to access terms of service" do
      click_link 'Terms of Service'
      has_text?('WaveLineup Terms of Service').should == true
    end

    it "should be able to access privacy policy" do
      click_link('Privacy Policy')
      has_text?('WaveLineup Privacy Policy').should == true
    end

    it "should be able to access about" do
      click_link('About')
      has_text?('About WaveLineup').should == true
    end

    it "should have copyright info" do
      page.has_content?('Copyright 2009-').should == true
    end

  end
end
