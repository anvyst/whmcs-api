$:.unshift 'lib'
require 'rake/testtask'

# See: http://www.whmcs.com/demo/
ENV['WHMCS_USER'] = 'Admin'
ENV['WHMCS_URL']  = 'http://demo.whmcs.com/includes/api.php'
ENV['WHMCS_DEMO'] = 'demo'
ENV['WHMCS_KEY']  = 'whmcsdemo'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test' << '.'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
  test.warning = true
end

task :default => :test
