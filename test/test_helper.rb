require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'coveralls'

Coveralls.wear!

begin
  require 'turn'
rescue LoadError
end

require 'whmcs'

WHMCS.configure do |config|
  config.api_username = ENV['WHMCS_USER'] or raise "You must set the env variable WHMCS_USER"
  config.api_password = ENV['WHMCS_PASS'] or raise "You must set the env variable WHMCS_PASS"
  config.api_url = ENV['WHMCS_URL']  or raise "You must set the env variable WHMCS_URL"
  config.api_key = ENV['WHMCS_KEY']  or raise "You must set the env variable WHMCS_KEY"
end
