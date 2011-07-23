Factory.define :feature_request do |f|
  f.name 'feature name here'
  f.description 'feature description here'
  f.notes 'feature notes here'
  f.popularity_priority_index 1
end

Factory.define :feature_request_implemented, :parent => :feature_request do |f|
  f.date_implemented Date.today
end
