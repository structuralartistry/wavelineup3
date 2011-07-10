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
user.email = 'system@wavelineup.com'
user.password = 'Password1'
user.password_confirmation = 'Password1'
user.role_id = Role.find_by_name('sysadmin').id
user.active = true
user.save


if RAILS_ENV='development'
  # create a demo practice and user
  practice = Practice.create(:name => 'Demo Practice', :time_zone => 'Mexico City')
  user = User.new
  user.email = 'dk.kahn@gmail.com'
  user.password = 'Password1'
  user.password_confirmation = 'Password1'
  user.practice_id = practice.id
  user.role_id = Role.find_by_name('practice admin').id
  user.active = true
  user.save

  user = User.new
  user.email = 'dnathankahn@yahoo.com'
  user.password = 'Password1'
  user.password_confirmation = 'Password1'
  user.practice_id = practice.id
  user.role_id = Role.find_by_name('practice user').id
  user.active = true
  user.save

  # populate data into test practice for seeded demo
#  last_names = %w(Apple	Buoboy	Charles	Darwin	Erickson	Frederick	Glass	Heller	Inverson	Jolie	Kahn	Lee	Ming	Norrey	Openheimer	Petersen	Quartz	Robinson	Sing	Tho	Uebbing	Vincenza	Wang	Xi	Yeller	Zetter)
#  first_names = %w(John	Barbara	Myra	Erik	John	Peter	Sonya	Linda	Mark	Jessica	David	Juan	Hong	Erika	Clemens	Malya	Robin	Rhonda	Ronald	Ving	Rocky	Maria	Yi	Xy	Michael	Ron)
#  initials = %w(A	B	C	D	E	F	G	H	I	J	K	L	M	N	O	P	Q	R	S	T	U	V	W	X	Y	Z)
#
#  initials.each do |initial|
#    5.times do
#      PracticeMember.create(:practice => practice,
#                            :last_name => "#{initial}#{last_names.sample.downcase}",
#                            :first_name => first_names.sample,
#                            :middle_name => initials.sample)
#    end
#  end
end
