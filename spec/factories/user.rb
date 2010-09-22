Factory.define :user do |u|
  u.password 'password1'
  u.password_confirmation 'password1'  
end

Factory.define :sysadmin_user, :parent => :user do |u|
  u.email 'sysadmin@structuralartistry.com'
end

Factory.define :practice_user , :parent => :user do |u|
  u.email 'practice@structuralartistry.com'
end

