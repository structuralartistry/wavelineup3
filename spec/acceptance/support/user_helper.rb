def register_and_activate(role, email)
  role = role.to_sym
  
  Factory.create(:sysadmin_role)
  Factory.create(:practice_admin_role)
  Factory.create(:practice_user_role)
  
  practice = Factory.create(:practice_one)
  
  user = Factory.build(role)  
  user.email = email
  user.active = true
  user.practice_id = practice.id  
  user.save  
end
