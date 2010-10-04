Factory.define :user do |u|
  u.password 'password1'
  u.password_confirmation 'password1'
  u.role { |a| a.association(:role) }  
  u.sequence(:email) {|n| "user#{n}@structuralartistry.com" }
  u.active true
end

Factory.define :sysadmin, :parent => :user do |u|
  u.practice_id nil
  u.role { |a| a.association(:sysadmin_role) }   
end

Factory.define :practice_admin, :parent => :user do |u|
  u.practice { |a| a.association(:practice_one) }
  u.role { |a| a.association(:practice_admin_role) }   
end

Factory.define :practice_user, :parent => :user do |u|
  u.practice { |a| a.association(:practice_one) }
  u.role { |a| a.association(:practice_user_role) }   
end

Factory.define :practice_admin_two, :parent => :user do |u|
  u.practice { |a| a.association(:practice_two) }
  u.role { |a| a.association(:practice_admin_role) }   
end

Factory.define :practice_user_two, :parent => :user do |u|
  u.practice { |a| a.association(:practice_two) }
  u.role { |a| a.association(:practice_user_role) }   
end