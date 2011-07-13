task :heroku_deploy do
  puts 'Packaging assets with Jammit!'
  require 'jammit'
#  Jammit.package!  # packages assets to public/assets directory

  # add a copyright notice to all assets files
  copyright_notice = "//All code except where noted copyright by StructuralArtistry #{Date.today.year}. All rights reserved."
  dir = File.expand_path('public/assets')
  Dir.foreach(dir) do |file|
    file_dir = File.expand_path(file)
puts file_dir
    if File.file?(file_dir) && (file_dir =~ /css/ || file_dir =~ /js/)
puts 'found'
      temp_file_dir =  "#{file_dir}.tmp"
      File.open(temp_file_dir,"w") do |newfile|
puts newfile
        newfile.puts copyright_notice
        newfile.puts File.read(file_dir)      

#        File.delete(file)
#        File.rename(temp_file_name, file)
      end
    end
  end

#  puts 'Updating and committing local git'
#  `git add .`
#  `git commit -am 'packaged assets prior to heroku push'`
#  puts 'Pushing git origin master'
#  `git push origin master`
#  puts 'Pushing to Heroku'
#  `git push heroku master`
#  puts 'Deploy completed'
end
