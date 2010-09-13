Factory.define :user do |u|
  u.login 'jdoe'
  u.email 'jdoe@gmail.com'
  u.password 'password1'
  u.password_confirmation 'password1'
end