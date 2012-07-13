app = "immunity_integration_test_app"

desc "deploy"
task :deploy => [:stop, :stage, :start] do
end

task :stage do
  puts "Deploying to /tmp/#{app}"
  FileUtils.rm_rf "/tmp/#{app}"
  system("rsync -aqE --exclude .git ./ /tmp/#{app}")
end

desc "start the server"
task :start do
  puts "Starting #{app}."
  `nohup ./run_server.sh #{app} 2>/dev/null > /dev/null &`
end

desc "stop the server"
task :stop do
  process_ids = `ps ax | grep #{app} | grep -v grep`.split("\n").map { |line| line.split(" ")[0].to_i }
  process_ids.each { |id| `kill -9 #{id} 2> /dev/null` if id > 0 }
end
