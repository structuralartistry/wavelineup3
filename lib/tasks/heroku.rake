task :heroku_deploy do
  require 'jammit'
  Jammit.package!  # packages assets to public/assets directory
  `git add .`
  `git commit -am 'packaged assets prior to heroku push'`
  `git push origin master`
  `git push heroku master`
end