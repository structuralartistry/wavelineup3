Factory.define :role do |f|
end

Factory.define :sysadmin_role, :class => "Role" do |f|
  f.name 'sysadmin'
end

Factory.define :practice_admin_role, :class => "Role" do |f|
  f.name 'practice admin'
end

Factory.define :practice_user_role, :class => "Role" do |f|
  f.name 'practice user'
end
