Factory.define :invitation do |f|
  f.sequence(:email) {|n| "user#{n}@structuralartistry.com" }
  f.referring_user_id 1
end
