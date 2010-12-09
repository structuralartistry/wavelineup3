task :play_sound do
  `afplay config/deploy/deploy_sound.aiff &`
end

task :cukes_no_js do
  sh "cucumber -f pretty -t ~@javascript"
end

task :cukes_js do
  sh "cucumber -f pretty -t @javascript"
end

task :cukes_no_tc do
  sh "cucumber -f pretty -e travel_card"
end

task :cukes_tc_only do
 sh "cucumber features/travel_card.feature -f pretty"
end

task :cukes_all do
  sh "cucumber -f pretty" 
end

task :suite do
  sh "cucumber -f pretty"
end

