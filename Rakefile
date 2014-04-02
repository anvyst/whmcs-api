$:.unshift 'lib'
require 'rake/testtask'

# See: http://www.whmcs.com/demo/
ENV['WHMCS_USER'] = 'Admin'
ENV['WHMCS_URL']  = 'http://demo.whmcs.com/includes/api.php'
ENV['WHMCS_PASS'] = 'fe01ce2a7fbac8fafaed7c982a04e229' #md5('demo')
ENV['WHMCS_KEY']  = 'whmcsdemo'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test' << '.'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
  test.warning = true
end

task :default => :test
