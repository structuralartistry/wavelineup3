Factory.sequence :name do |n|
  result = "AAAAA"
  n.times { result.succ! }
  result
end

