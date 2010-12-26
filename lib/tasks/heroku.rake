task :heroku_deploy do
  p 'Packaging assets with Jammit!'
  require 'jammit'
  Jammit.package!  # packages assets to public/assets directory
  p 'Updating and committing local git'
  `git add .`
  `git commit -am 'packaged assets prior to heroku push'`
  p 'Pushing git origin master'
  `git push origin master`
  p 'Pushing to Heroku'
  `git push heroku master`
  p 'Done!'
end