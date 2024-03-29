Factory.define :user do |u|
  u.password STANDARD_TEST_PASSWORD
  u.password_confirmation STANDARD_TEST_PASSWORD
  u.role { |a| a.association(:role) }
  u.sequence(:email) {|n| "user#{n}@structuralartistry.com" }
  u.active true
end

Factory.define :sysadmin_user, :parent => :user do |u|
  u.role { |a| a.association(:sysadmin_role) }
end

Factory.define :practice_admin_user, :parent => :user do |u|
  u.role { |a| a.association(:practice_admin_role) }
end

Factory.define :practice_user, :parent => :user do |u|
  u.role { |a| a.association(:practice_user_role) }
end
