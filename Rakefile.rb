# task :default => [:test]

desc 'test1'
task :test do
  puts 'its rake test'
end

desc 'rake test22'
task :test2 do
  puts 'rake test2'
end

task :default do
  puts 'default '
end