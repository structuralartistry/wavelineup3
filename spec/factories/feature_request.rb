Factory.define :feature_request do |f|
  f.name 'feature name here'
  f.description 'feature description here'
  f.notes 'feature notes here'
  f.times_requested 1
end

Factory.define :feature_request_implemented, :parent => :feature_request do |f|
  f.date_implemented Date.today
end
