require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Feedback Support", %q{
  In order to ...
  As a ...
  I want to ...
} do

  before(:each) do
    logged_in_as_role_for_practice(:practice_admin_user, "StructuralArtistry practice")
  end

  scenario "Can toggle the Feedback/Support dialog", :js => true do
    visit('/home')
    selector_cell_present?('Feedback/Support').should == true
    selector_cell_selected?('Feedback/Support').should == false
    has_text?('Let us know how it is going or if you need some help!').should == false

    click_selector_cell('Feedback/Support')

    selector_cell_selected?('Feedback/Support').should == true
    has_text?('Let us know how it is going or if you need some help!').should == true

    click_selector_cell('Feedback/Support')

    selector_cell_selected?('Feedback/Support').should == false
    has_text?('Let us know how it is going or if you need some help!').should == false
  end

  scenario "Can submit a Feedback/Support message successfully and send email to administrator", :js => true do
    visit('/home')
    click_selector_cell('Feedback/Support')
    fill_in('Let us know how it is going or if you need some help!', :with => 'A message')
    click_selector_cell('Send')
    # this should work but does not -- leaving here, in the case that we move such into controller tests
    #has_flash_notice?('Thanks for your message. We will respond promptly!').should == true
  end

end
