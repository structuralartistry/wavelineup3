Factory.define :practice_member do |pm|
  # random_name = Proc.new {|n| (0...n).map{65.+(rand(25)).chr}.join}
  pm.last_name {Factory.next :name}
  pm.first_name {Factory.next :name}
  pm.middle_name {Factory.next :name}
  pm.practice_id 1
end
# 
# 
# Factory.define :practice_member do |pm|
#   pm.last_name "Kahn"
#   pm.first_name "David"
#   pm.middle_name "Nathan"
#   pm.practice_id 1
# end
# 
# Factory.define :practice_member_one, :parent => :practice_member do |pm|
#   pm.last_name "Mena"
#   pm.first_name "Marisela"
#   pm.middle_name "Montiel"
# end
# 

