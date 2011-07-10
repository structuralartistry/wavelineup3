Factory.define :practice_member do |pm|
  # random_name = Proc.new {|n| (0...n).map{65.+(rand(25)).chr}.join}
  pm.last_name {Factory.next :name}
  pm.first_name {Factory.next :name}
  pm.middle_name {Factory.next :name}
  pm.practice_id {Practice.first || Factory(:practice_one)}
end
