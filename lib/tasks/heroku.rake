task :heroku_deploy do
  puts 'Packaging assets with Jammit!'
  require 'jammit'
  Jammit.package!  # packages assets to public/assets directory
  puts 'Updating and committing local git'
  `git add .`
  `git commit -am 'packaged assets prior to heroku push'`
  puts 'Pushing git origin master'
  `git push origin master`
  puts 'Pushing to Heroku'
  `git push heroku master`
  puts 'Deploy completed'
end
