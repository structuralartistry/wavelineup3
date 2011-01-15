require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Practice Registration Feature", %q{
  A new chiropractic practice can sign up for an account.
  When setting up a new account a primary user is set up in the process.
  The new user must activate their user via their email so we are assured to have a good email address for every user.
} do
  
  scenario "Register a new Practice and activate in system" do
    Factory.create(:practice_admin_user)
    
    visit('/login')
    click_selector_cell('Create My Practice')
    assert has_text?('Create Practice', 'h1')
    assert has_text?('Practice name', 'label')
    assert has_text?('Email', 'label')
    assert has_text?('Password', 'label')
    assert has_text?('Password confirmation', 'label')
    has_text?('Time zone', 'label').should == true
    selector_cell_present?('Cancel')
    has_content?("By clicking 'Submit' you agree to")
    
    fill_in('Practice name', :with => 'Practice One')
    user_email = 'practice@structuralartistry.com'
    fill_in('Email', :with => user_email)
    fill_in('Password', :with => 'Password1')
    fill_in('Password confirmation', :with => 'Password1')
    select('Eastern Time (US & Canada)', :from => 'Time zone')
    click_button('Submit')
    
    has_flash_notice?('Practice was successfully created. Please check your email for the activation link.')
    
    activate_user?(user_email).should == true
  end
  
  scenario "Can not register an existing practice name" do
    Factory.create(:practice_admin_user)
    Factory.create(:practice_one)
    
    visit('/login')
    click_selector_cell('Create My Practice')
    
    fill_in('Practice name', :with => 'Practice One')
    fill_in('Email', :with => 'practice@structuralartistry.com')
    fill_in('Password', :with => 'Password1')
    fill_in('Password confirmation', :with => 'Password1')
    select('Eastern Time (US & Canada)', :from => 'Time zone')
    click_button('Submit')
    
    assert has_text?('Practice name has already been taken')
  end
  
end
