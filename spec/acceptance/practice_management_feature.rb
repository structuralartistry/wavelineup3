require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Practice Management Feature", %q{
  In order to ...
  As a ...
  I want to ...
} do
  
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
    has_text?('Practice Users', 'th').should == true
    has_text?('Time zone', 'label').should == true
    has_text?(@practice.users[0].email).should == true

    new_practice_name = 'New Practice Name'
    fill_in('Practice name', :with => new_practice_name)
    select('Eastern Time (US & Canada)', :from => 'Time zone')
    click_selector_cell('Submit')
    
    has_flash_notice?('Practice was successfully updated').should == true
    title_contains?(new_practice_name)
  end

end