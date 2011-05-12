def logged_in_as_role(role)
  logged_in_as_role_for_practice(role, 'Practice One')
end


def logged_in_as_role_for_practice(role, practice_name)
  practice = Factory.create(:practice, :name => practice_name)

  role = role.to_sym

  Factory.create(role)

  user = Factory.create(role, :email => "#{role.to_s}_user@structuralartistry.com", :practice_id => practice.id)

  visit('/login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'Password1')
  click_button('Submit')
  selector_cell_present?('Logout').should == true
  practice
end


def login_as_email_and_password?(email, password)
  visit('/login')
  fill_in('Email', :with => email)
  fill_in('Password', :with => password)
  click_button('Submit')
  return selector_cell_present?('Logout')
end

def log_out
  visit('/logout')
end

