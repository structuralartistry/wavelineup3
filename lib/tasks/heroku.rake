task :heroku_deploy do
  print ''
  print 'Packaging assets with Jammit!'
  print ''
  require 'jammit'
  Jammit.package!  # packages assets to public/assets directory
  print ''
  print 'Updating and committing local git'
  print ''
  `git add .`
  `git commit -am 'packaged assets prior to heroku push'`
  print ''
  print 'Pushing git origin master'
  print ''
  `git push origin master`
  print ''
  print 'Pushing to Heroku'
  print ''
  `git push heroku master`
  print ''
  print 'Complete'
end