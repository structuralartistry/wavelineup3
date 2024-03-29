require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "User Management Feature", %q{
  In order to ...
  As a ...
  I want to ...
} do

  before(:each) do
    @practice = logged_in_as_role_for_practice(:practice_admin_user, "StructuralArtistry practice")
    @logged_in_user = @practice.users[0]
    visit('/home')
  end

  scenario "I can add a user to my practice and activate the user" do
    Factory.create(:practice_user)

    click_selector_cell('Edit Practice')
    click_selector_cell('New User')

    has_text?('New User', 'h1').should == true
    has_text?('Email', 'label').should == true
    has_text?('Password', 'label').should == true
    has_text?('Password confirmation').should == true

    new_user_email = 'new_user@gmail.com'
    fill_in('Email', :with => new_user_email)
    fill_in('Password', :with => 'Password1')
    fill_in('Password confirmation', :with => 'Password1')
    click_selector_cell('Submit')

    has_flash_notice?('User was successfully created. Please check email for new_user@gmail.com for the activation link.').should == true
    has_text?(new_user_email, 'td').should eq(true)

    # cant activate while logged in
    activate_user?(new_user_email).should == false
    has_flash_notice?('You are already logged in to the system. If you are activating a new user please log out first and try again.').should == true

    # log out and activate
    click_selector_cell('Logout')
    activate_user?(new_user_email).should == true
    confirm_home_page_loaded

    # can not resubmit activation
    click_selector_cell('Logout')
    activate_user?(new_user_email).should == false
    has_flash_notice?('This user is already active. You have been logged in to the system.').should == true
    confirm_home_page_loaded
  end

  scenario "if user tries to log in with inactivated user, they receive a message and can request the activation link to be resent" do
    Factory.create(:practice_user, :perishable_token => '123456')

    click_selector_cell('Edit Practice')
    click_selector_cell('New User')

    has_text?('New User', 'h1').should == true
    has_text?('Email', 'label').should == true
    has_text?('Password', 'label').should == true
    has_text?('Password confirmation').should == true

    new_user_email = 'new_user@gmail.com'
    fill_in('Email', :with => new_user_email)
    fill_in('Password', :with => 'Password1')
    fill_in('Password confirmation', :with => 'Password1')
    click_selector_cell('Submit')

    has_flash_notice?('User was successfully created. Please check email for new_user@gmail.com for the activation link.').should == true
    has_text?(new_user_email, 'td').should eq(true)

    # should get reactivation info if tries to log in before activated
    click_selector_cell('Logout')
    visit(login_url)
    fill_in('Email', :with => new_user_email)
    fill_in('Password', :with => 'Password1')
    click_selector_cell('Submit')

    page.has_content?('Your account is not active. Please check your email for activation link or click').should == true

    click_link('here')
    page.has_content?('The activation link has been resent')
    page.has_content?('Login')
  end

  scenario "I can change my user profile - email address and password" do
    click_selector_cell('Edit User')
    has_text?('Edit User', 'h1').should == true
    has_text?('Email', 'label').should == true
    has_text?('Password', 'label').should == true
    has_text?('Password confirmation').should == true

    new_user_email = 'jockey@kong.com'
    new_user_password = 'Password2'
    fill_in('Email', :with => new_user_email)
    fill_in('Password', :with => new_user_password)
    fill_in('Password confirmation', :with => new_user_password)
    click_selector_cell('Submit')
    has_flash_notice?('User profile successfully updated').should == true

    click_selector_cell('Logout')
    login_as_email_and_password?(new_user_email, new_user_password).should == true
    confirm_home_page_loaded
  end

  scenario "I can delete a user from my practice" do
    new_user_email = 'another@gmail.com'
    register_and_activate_user(new_user_email, @practice.name, :practice_user)
    click_selector_cell('Edit Practice')

    has_text?(new_user_email, 'td').should eq(true)
    # tell_brower_to_auto_accept_delete
    page.find(:xpath, "//tr[@id='#{new_user_email}']//input[@value='Delete']").click
    has_flash_notice?('User successfully deleted').should == true

    has_text?(new_user_email, 'td').should == false
  end

  scenario "The current user can not be deleted" do
    click_selector_cell('Edit Practice')
    page.find(:xpath, "//tr[@id='#{@logged_in_user.email}']//input[@value='Delete']").click
    has_flash_notice?('Can not delete the current user').should == true
  end

end
