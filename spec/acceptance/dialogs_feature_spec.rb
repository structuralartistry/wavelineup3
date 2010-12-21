require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "New Practice Member and Find dialog feature", %q{
  In order to ...
  As a ...
  I want to ...
} do
  
  context "New Practice Member and Find dialog operations", :js => true do
  
    before(:each) do
      logged_in_as_role_for_practice(:practice_admin_user, "StructuralArtistry practice")
      create_practice_member("Kahn, David N", "StructuralArtistry practice")
      create_practice_member("Apple, Johnny R", "StructuralArtistry practice")
      visit('/home')
    end
  
    scenario "New Practice Member, Find and Feedback Support dialogs show, hide and cancel eachother" do
      
      click_selector_cell('New Practice Member')
      new_practice_member_dialog_present?.should == true
      find_dialog_present?.should == false
      feedback_support_dialog_present?.should == false
      
      click_selector_cell('Find')
      new_practice_member_dialog_present?.should == false
      find_dialog_present?.should == true
      feedback_support_dialog_present?.should == false

      click_selector_cell('Feedback/Support')
      new_practice_member_dialog_present?.should == false
      find_dialog_present?.should == false
      feedback_support_dialog_present?.should == true
      
      click_selector_cell('New Practice Member')
      new_practice_member_dialog_present?.should == true
      find_dialog_present?.should == false
      feedback_support_dialog_present?.should == false
    end
  
    scenario "I can click on the 'K' alphabet key and only see practice members whose last name starts with 'K'" do
      click_selector_cell('Find')
      assert selector_cell_present?('Kahn, David N')
      assert selector_cell_present?('Apple, Johnny R')
      click_selector_cell('K')
      assert selector_cell_present?('Kahn, David N')
      assert !selector_cell_present?('Apple, Johnny R')
    end
    
    scenario "Feedback and Support dialog operations", :js => true do
      visit('/home')
      has_text?('Let us know how it is going or if you need some help!').should == false
      selector_cell_selected?('Feedback/Support').should == false
      click_selector_cell('Feedback/Support')
      selector_cell_selected?('Feedback/Support').should == true

      has_text?('Feedback & Support', 'h1').should == true
      fill_in('Let us know how it is going or if you need some help!', :with => 'A comment provided')
      click_selector_cell('Send')

      has_text?('Thanks for your message. We will respond promptly!', 'p')
      
      selector_cell_present?('New Practice Member').should == true # page gets reinitialized to reset the form and the send button as a selector cell, so make sure these are present
      selector_cell_present?('Find').should == true
      selector_cell_present?('Feedback/Support').should == true
    end
    
  end
  
end