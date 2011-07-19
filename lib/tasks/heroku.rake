task :heroku_deploy do
  puts 'Packaging assets with Jammit!'
  require 'jammit'
  Jammit.package!  # packages assets to public/assets directory

  # add a copyright notice to all assets files
  # note: turned off gzip on jammit to allow this
  dir = File.expand_path('public/assets')
  Dir.foreach(dir) do |file|
    file_dir = File.expand_path("#{dir}/#{file}")
    if File.exists?(file_dir) && (file_dir =~ /css/ || file_dir =~ /js/)
      copyright_notice = "All code except where otherwise noted is copyright by StructuralArtistry #{Date.today.year}. All rights reserved."
      copyright_notice = "/* #{copyright_notice} */" if file_dir =~ /css/
      copyright_notice = "// #{copyright_notice}"if file_dir =~ /js/
      temp_file_dir =  "#{file_dir}.tmp"
      File.open(temp_file_dir,"w") do |newfile|
        newfile.puts copyright_notice
        newfile.puts File.read(file_dir)      

        File.delete(file_dir)
        File.rename(temp_file_dir, file_dir)
      end
    end
  end

  puts 'Updating and committing local git'
  `git add .`
  `git commit -am 'packaged assets prior to heroku push'`
  puts 'Pushing git origin master'
  `git push origin master`
  puts 'Pushing to Heroku'
  `git push heroku master --app wavelineup`
  puts 'Deploy completed'
end

task :heroku_deploy_staging do
  puts 'Packaging assets with Jammit!'
  require 'jammit'
  Jammit.package!  # packages assets to public/assets directory

  # add a copyright notice to all assets files
  # note: turned off gzip on jammit to allow this
  dir = File.expand_path('public/assets')
  Dir.foreach(dir) do |file|
    file_dir = File.expand_path("#{dir}/#{file}")
    if File.exists?(file_dir) && (file_dir =~ /css/ || file_dir =~ /js/)
      copyright_notice = "All code except where otherwise noted is copyright by StructuralArtistry #{Date.today.year}. All rights reserved."
      copyright_notice = "/* #{copyright_notice} */" if file_dir =~ /css/
      copyright_notice = "// #{copyright_notice}"if file_dir =~ /js/
      temp_file_dir =  "#{file_dir}.tmp"
      File.open(temp_file_dir,"w") do |newfile|
        newfile.puts copyright_notice
        newfile.puts File.read(file_dir)      

        File.delete(file_dir)
        File.rename(temp_file_dir, file_dir)
      end
    end
  end

  puts 'Updating and committing local git'
  `git add .`
  `git commit -am 'packaged assets prior to heroku push'`
  puts 'Pushing git origin master'
  `git push origin master`
  puts 'Pushing to Heroku'
  `git push staging master`
  puts 'Deploy completed'
end
