Factory.define :practice do |p|
  p.time_zone 'Eastern Time (US & Canada)'
end

Factory.define :practice_one, :parent => :practice do |p|
  p.name 'Practice One'
end

Factory.define :practice_two, :parent => :practice do |p|
  p.name 'Practice Two'
  
end

Factory.define :practice_three, :parent => :practice do |p|
  p.name 'Practice Three'
end

