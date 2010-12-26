task :heroku_deploy do
  require 'jammit'
  Jammit.package!
  `git add .`
  `git commit -am 'packaged assets prior to heroku push'`
  `git push origin master`
  `git push heroku master`
end