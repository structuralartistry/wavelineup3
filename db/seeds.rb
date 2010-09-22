# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.new
user.login = 'sysadmin'
user.email = 'dk@structuralartistry.com'
user.password = 'password1'
user.password_confirmation = 'password1'
user.save

puts ""
puts "WARNING: Sysadmin has an unsecure password, '#{user.password}'. Change before production!"
puts ""

user = User.new
user.login = 'practice'
user.email = 'practice@gmail.com'
user.password = 'password1'
user.password_confirmation = 'password1'
user.save
