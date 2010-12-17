require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

def new_practice_member_dialog_present?
  return selector_cell_selected?('New Practice Member') && has_text?('New Practice Member', 'h1')
end

def find_dialog_present?
  return selector_cell_selected?('Find') && has_text?('All', 'td') && has_text?('0-9', 'td')
end

feature "Practice Member Administration Feature", %q{
  In order to ...
  As a ...
  I want to ...
} do
  
  context "Selector dialog operations - New Practice Member and Find", :js => true do
    before(:each) do
      logged_in_as_role_for_practice(:practice_admin_user, "StructuralArtistry practice")
      create_practice_member("Kahn, David N", "StructuralArtistry practice")
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
    
  end
  
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

      assert has_text?('Practice member name already exists in your Practice')
    end
    
    scenario "Find and Edit an Existing Practice Member" do
      click_selector_cell('Find')
      click_selector_cell('Edit Personal Info')
      click_selector_cell('Kahn, David N')
      assert has_text?('Edit Practice Member', 'h1')
    end
    
    scenario "Delete a Practice Member" do
      click_selector_cell('Find')
      click_selector_cell('Edit Personal Info')
      click_selector_cell('Kahn, David N')
      assert has_text?('Edit Practice Member', 'h1')
      
      tell_brower_toauto_accept_delete
      click_selector_cell('Delete')
      assert has_text?('Practice Member successfully deleted')
      
    end
    
  end
    
  # scenario "Creating and Finding a Practice Member", :js => true do
  #   logged_in_as_role_for_practice(:practice_admin_user, "StructuralArtistry practice")
  #   visit('/home')
  #   
  #   assert !has_text?('New Practice Member', 'h1')
  #   
  #   click_selector_cell('New Practice Member')
  #   assert selector_cell_selected?('New Practice Member')
  #   assert has_text?('New Practice Member', 'h1')
  #   
  #   click_selector_cell('New Practice Member')
  #   assert !selector_cell_selected?('New Practice Member')
  #   assert !has_text?('New Practice Member', 'h1')
  #   
  #   click_selector_cell('New Practice Member')
  #   fill_in('Last Name', :with => 'Kahn')
  #   fill_in('First Name', :with => 'David')
  #   fill_in('Middle Name', :with => 'Nathan')
  #   click_selector_cell('Submit')
  #   
  #   assert has_text?('Practice Member successfully created')
  #   
  #   click_selector_cell('Find')
  #   assert selector_cell_is_present?('Kahn, David N')
  #   
  #   click_selector_cell('New Practice Member')
  #   fill_in('Last Name', :with => 'Kahn')
  #   fill_in('First Name', :with => 'David')
  #   fill_in('Middle Name', :with => 'Nathan')
  #   click_selector_cell('Submit')
  #   
  #   assert has_text?('Practice member name already exists in your Practice')
  #   click_selector_cell('Find')
  #   assert !selector_cell_is_present?('Kahn, David N')
  # end
    
  
end


#   @javascript
#   Scenario: As a practice user I want to modify an existing Practice Member in the system
#     Given there is a Practice Member in my practice named "Hello Kitty Practice" by the name of "Kahn, David N"
#     Given I am on the home page
#     When I click "Find" within a selector cell
#     When I click "Edit Personal Info" within a selector cell
#     When I click "Kahn, David N" within a selector cell
#     Then I should see "Edit Practice Member" within "h1"
#     When I fill in "practice_member_name_first" with "Michael" within the edit "PracticeMember" form for "Kahn, David N"
#     When I fill in "practice_member_name_middle" with "Louis" within the edit "PracticeMember" form for "Kahn, David N"
#   When I press "Submit" within the edit "PracticeMember" form for "Kahn, David N"
#     Then I should see "Practice Member successfully updated"
#     When I click "Find" within a selector cell
#     Then I should see "Kahn, Michael Louis" within a selector cell
#     
#   @javascript
#   Scenario: As a practice user I want to remove an existing Practice Member from the system
#     Given there is a Practice Member in my practice named "Hello Kitty Practice" by the name of "Doe, John"
#     Given there is a Practice Member in my practice named "Hello Kitty Practice" by the name of "Kahn, David N"
#     Given I am on the home page
#     When I click "Find" within a selector cell
#     When I click "Edit Personal Info" within a selector cell
#     When I click "Kahn, David N" within a selector cell
#     Then I should see "Edit Practice Member" within "h1"
#     Then tell the page to accept the confirm dialog which is coming
#     When I press "Delete"
#     Then I should see "Practice Member successfully deleted"
#     When I click "Find" within a selector cell
#     Then I should not see "Kahn, David N" within a selector cell
#     
#     
#   
