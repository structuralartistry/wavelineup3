require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Practice Member Administration Feature", %q{
  In order to ...
  As a ...
  I want to ...
} do
    
  scenario "Create a New Practice Member", :js => true do
    logged_in_as_role_for_practice(:practice_admin_user, "StructuralArtistry practice")
    visit('/home')
    click_selector_cell('New Practice Member')
    fill_in('Last Name', :with => 'Kahn')
    fill_in('First Name', :with => 'David')
    fill_in('Middle Name', :with => 'Nathan')
    click_selector_cell('Submit')

    assert has_text?('Practice Member successfully created')
  end
  
  context "Existing Practice Member life cycle", :js => true do
    
    before(:each) do
      logged_in_as_role_for_practice(:practice_admin_user, "StructuralArtistry practice")
      create_practice_member("Kahn, David N", "StructuralArtistry practice")
      visit('/home')
    end
        
    scenario "Return validation errors" do
      click_selector_cell('New Practice Member')
      fill_in('Last Name', :with => 'Kahn')
      fill_in('First Name', :with => 'David')
      fill_in('Middle Name', :with => 'N')
      click_selector_cell('Submit')

      assert has_text?('First name has already been taken in combination with this middle and last name.')
    end
    
    scenario "Find and Edit an Existing Practice Member" do
      click_selector_cell('Find')
      click_selector_cell('Edit Personal Info')
      click_selector_cell('Kahn, David N')
      assert has_text?('Edit Practice Member', 'h1')
    end
    
    scenario "Find and Edit a Existing Practice Member Travel Card" do
      click_selector_cell('Find')
      click_selector_cell('Travel Card')
      click_selector_cell('Kahn, David N')
      assert has_text?('Rsp Wv', 'td')
    end
    
    scenario "Delete a Practice Member" do
      click_selector_cell('Find')
      click_selector_cell('Edit Personal Info')
      click_selector_cell('Kahn, David N')
      assert has_text?('Edit Practice Member', 'h1')
      
      tell_brower_to_auto_accept_delete
      click_selector_cell('Delete')
      assert has_text?('Practice Member successfully deleted')
    end
    
  end
    
end