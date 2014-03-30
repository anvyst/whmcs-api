module WHMCS
  autoload :Version,	"whmcs/version"
  autoload :Config,		"whmcs/config"
  autoload :Base,			"whmcs/base"
  autoload :Client,		"whmcs/client"
	autoload :Domain,		"whmcs/domain"
  autoload :Invoice,	"whmcs/invoice"
  autoload :Misc,			"whmcs/misc"
  autoload :Module,		"whmcs/module"
  autoload :Order,		"whmcs/order"
  autoload :Quote,		"whmcs/quote"
  autoload :Ticket,		"whmcs/ticket"
	autoload :Announcement, "whmcs/announcement"

  class << self
    attr_accessor :config
  end

  self.config ||= Config.new

  # Pass a block to configure the WHMCS API
  #
  #   WHMCS.configure do |config|
  #     config.api_username = 'apiuser'
  #     config.api_password = 'c4ca4238a0b923820dcc509a6f75849b'
  #     config.api_url      = 'http://example.com/includes/api.php
	#     config.api_key			= '123nifuasdfasdf97' # if any
  #   end
  def self.configure
    yield config
    config
  end
end
