Factory.define :feedback_support do |f|
  f.user_id {Factory(:user)}
  f.message 'Feedback support message'
  f.location_in_application 'some_url'
end
