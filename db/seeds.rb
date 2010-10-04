# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Role.create(:name => 'sysadmin')
Role.create(:name => 'practice admin')
Role.create(:name => 'practice user')

user = User.new
user.email = 'sysadmin@structuralartistry.com'
user.password = 'password1'
user.password_confirmation = 'password1'
user.role_id = Role.find_by_name('sysadmin').id
user.save

puts ""
puts "WARNING: Sysadmin has an unsecure password, '#{user.password}'. Change before production!"
puts ""

# create a demo practice and user
practice = Practice.create(:name => "Demo Practice")
user = User.new
user.email = 'dk.kahn@gmail.com'
user.password = 'password1'
user.password_confirmation = 'password1'
user.practice_id = practice.id
user.role_id = Role.find_by_name('practice admin').id
user.active = true
user.save
