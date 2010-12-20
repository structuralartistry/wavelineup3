require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "New Practice Member and Find dialog feature", %q{
  In order to ...
  As a ...
  I want to ...
} do
  
  context "dialog operations", :js => true do
  
    before(:each) do
      logged_in_as_role_for_practice(:practice_admin_user, "StructuralArtistry practice")
      create_practice_member("Kahn, David N", "StructuralArtistry practice")
      create_practice_member("Apple, Johnny R", "StructuralArtistry practice")
      visit('/home')
    end
  
    scenario "Show and hide the New Practice Member dialog" do   
      assert !new_practice_member_dialog_present?  

      click_selector_cell('New Practice Member')
      assert new_practice_member_dialog_present? 

      click_selector_cell('New Practice Member')
      assert !selector_cell_selected?('New Practice Member')
      assert !has_text?('New Practice Member', 'h1')
    end
  
    scenario "Show and hide the Find dialog" do
      assert !find_dialog_present?
      click_selector_cell('Find')
      assert find_dialog_present?
      click_selector_cell('Find')
      assert !find_dialog_present?
    end
  
    scenario "New Practice Member and Find dialogs cancel eachother" do
      click_selector_cell('New Practice Member')
      assert new_practice_member_dialog_present? 
      click_selector_cell('Find')
      assert !new_practice_member_dialog_present? 
      assert find_dialog_present?
      click_selector_cell('New Practice Member')
      assert !find_dialog_present?
      assert new_practice_member_dialog_present? 
    end
  
    scenario "I can click on the 'K' alphabet key and only see practice members whose last name starts with 'K'" do
      click_selector_cell('Find')
      assert selector_cell_is_present?('Kahn, David N')
      assert selector_cell_is_present?('Apple, Johnny R')
      click_selector_cell('K')
      assert selector_cell_is_present?('Kahn, David N')
      assert !selector_cell_is_present?('Apple, Johnny R')
    end
    
  end
  
end