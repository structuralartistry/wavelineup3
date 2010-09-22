Factory.define :user do |u|
  u.password 'password1'
  u.password_confirmation 'password1'  
end

Factory.define :practice_user , :parent => :user do |u|
  u.login 'practice'
  u.email 'practice@gmail.com'
end

Factory.define :sysadmin_user, :parent => :user do |u|
  u.login "sysadmin"
  u.email 'sysadmin@gmail.com'
end
