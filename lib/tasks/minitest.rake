require "rake/testtask"

Rake::TestTask.new(:test => "db:test:prepare") do |t|
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  t.warning = false
end

task :default => :test
