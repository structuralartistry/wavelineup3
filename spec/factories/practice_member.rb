Factory.define :practice_member do |pm|
  # random_name = Proc.new {|n| (0...n).map{65.+(rand(25)).chr}.join}
  pm.name_last {Factory.next :name}
  pm.name_first {Factory.next :name}
  pm.name_middle {Factory.next :name}
  pm.practice_id 1
end
# 
# 
# Factory.define :practice_member do |pm|
#   pm.name_last "Kahn"
#   pm.name_first "David"
#   pm.name_middle "Nathan"
#   pm.practice_id 1
# end
# 
# Factory.define :practice_member_one, :parent => :practice_member do |pm|
#   pm.name_last "Mena"
#   pm.name_first "Marisela"
#   pm.name_middle "Montiel"
# end
# 

