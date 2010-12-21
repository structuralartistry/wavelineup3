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
  
  scenario "I can change the name of my practice" do
    selector_cell_present?(@practice.name).should == true
    click_selector_cell(@practice.name)
    
    has_text?('Manage Practice', 'h1').should == true
    has_text?('Practice name', 'label').should == true
    has_text?('Users', 'th').should == true
    has_text?(@practice.users[0].email).should == true

    new_practice_name = 'New Practice Name'
    fill_in('Practice name', :with => new_practice_name)
    click_selector_cell('Submit')
    
    has_text?('Practice was successfully updated').should == true
    selector_cell_present?(new_practice_name)
  end

  scenario "I can add a user to my practice and activate the user" do 
    Factory.create(:practice_user)
    
    click_selector_cell(@practice.name)
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
    
    has_text?('User was successfully created. Please check email for new_user@gmail.com for the activation link.').should == true
    has_text?(new_user_email, 'td')

    # cant activate while logged in
    activate_user?(new_user_email).should == false
    has_text?('You are already logged in to the system. If you are activating a new user please log out first and try again.').should == true

    # log out and activate
    click_selector_cell('Logout')
    activate_user?(new_user_email).should == true
    confirm_home_page_loaded
    
    # can not resubmit activation
    click_selector_cell('Logout')
    activate_user?(new_user_email).should == false
    has_text?('This user is already active. You have been logged in to the system.').should == true
    confirm_home_page_loaded
  end
  
  scenario "I can change my user profile - email address and password" do
    click_selector_cell(@practice.users[0].email)
    has_text?('Editing User', 'h1').should == true
    has_text?('Email', 'label').should == true
    has_text?('Password', 'label').should == true
    has_text?('Password confirmation').should == true
    
    new_user_email = 'jockey@kong.com'
    new_user_password = 'Password2'
    fill_in('Email', :with => new_user_email)
    fill_in('Password', :with => new_user_password)
    fill_in('Password confirmation', :with => new_user_password)
    click_selector_cell('Submit')
    has_text?('User profile successfully updated').should == true
    
    click_selector_cell('Logout')
    login_as_email_and_password?(new_user_email, new_user_password).should == true
    confirm_home_page_loaded
  end
  
  scenario "I can delete a user from my practice" do
    new_user_email = 'another@gmail.com'
    register_and_activate_user(new_user_email, @practice.name, :practice_user)
    click_selector_cell(@practice.name)
   
    has_text?(new_user_email, 'td')
    # tell_brower_to_auto_accept_delete
    page.find(:xpath, "//tr[@id='#{new_user_email}']//input[@value='Delete']").click
    has_text?('User successfully deleted').should == true
    
    has_text?(new_user_email, 'td').should == false
  end
  
  scenario "The current user can not be deleted" do
    click_selector_cell(@practice.name)
    page.find(:xpath, "//tr[@id='#{@logged_in_user.email}']//input[@value='Delete']").click
    
    has_text?('Can not delete the current user').should == true
  end
  
end
