def register_and_activate_user(email, practice_name, role)
  role = role.to_sym
  
  Factory.create(:sysadmin_role)
  Factory.create(:practice_admin_role)
  Factory.create(:practice_user_role)
  
  practice = Practice.where("name='#{practice_name}'").first
  
  practice = Factory.create(:practice_one) if !practice
  
  user = Factory.build(role)  
  user.email = email
  user.active = true
  user.practice_id = practice.id  
  user.save  
end

def activate_user?(email)
  user = User.where("email='#{email}'").first
  visit("/activations/#{user.perishable_token}") 
  return has_flash_notice?('Your account has been activated') 
end
