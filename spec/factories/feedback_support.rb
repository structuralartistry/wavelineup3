Factory.define :feedback_support do |f|
  f.user {User.first || Factory(:user)}
  f.message 'Feedback support message'
  f.location_in_application 'some_url'
end
