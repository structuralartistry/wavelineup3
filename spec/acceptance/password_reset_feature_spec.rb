require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Password Reset Feature", %q{
  To do...
} do
          
  scenario "A registered user resets their password" do
    user_email = "practice@structuralartistry.com"
    register_and_activate_user(user_email, 'Practice One', :practice_user)
    visit('/login')
    click_selector_cell("Forgot Password?")
    
    assert has_text?('Reset Password', 'h1')
    assert has_text?('Email', 'label')
    assert selector_cell_present?('Submit')
    assert selector_cell_present?('Cancel')

    fill_in('Email', :with => user_email)
    click_button('Submit')

    assert has_text?('Login', 'h1')
    assert has_text?('Instructions to reset your password have been emailed to you. Please check your email.')

    user = User.find_by_email(user_email)
    visit("/password_resets/#{user.perishable_token}/edit")

    assert has_text?('Reset Password', 'h1')
  
    assert has_text?("User: #{user_email}", 'label')
    assert has_text?('Password', 'label')
    assert has_text?('Password confirmation', 'label')
    
    new_password = 'newPassword1'
    fill_in('Password', :with => new_password)
    fill_in('Password confirmation', :with => new_password)
    click_button('Submit')
          
    assert has_text?('Password successfully updated')
    assert selector_cell_present?(user.email)
    
    visit('/logout')
    assert login_as_email_and_password?(user.email, new_password)
    confirm_home_page_loaded
  end
  
end