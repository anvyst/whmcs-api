# whmcs-ruby

[![Build Status](https://travis-ci.org/jujav4ik/whmcs-api.svg?branch=master)](https://travis-ci.org/jujav4ik/whmcs-api) | [![Coverage Status](https://coveralls.io/repos/jujav4ik/whmcs-api/badge.png)](https://coveralls.io/r/jujav4ik/whmcs-api)

whmcs-api provides Ruby bindings for the [WHMCS API](http://docs.whmcs.com/API#External_API).


## Usage

```ruby
    require 'whmcs-api'

    WHMCS.configure do |config|
      config.api_url      = 'http://example.com/includes/api.php'
      config.api_username = 'someusername'
      config.api_password = 'c4ca4238a0b923820dcc509a6f75849b' # md5 hash
	  # optionally add access key
	  config.api_key = 'YetAnotherAPIAccessKeyForWHMCS'

	end

    WHMCS::Client.get_clients_details(:clientid => '1')
```

## Useful links

* [Demo Credentials for WHMCS](http://www.whmcs.com/demo/)
* [WHMCS API](http://docs.whmcs.com/API#External_API)

## Copyright

Copyright (c) 2014 anvyst.com, under MIT License. Have fun!

Copyright (c) 2011 DotBlock.com, see LICENSE in this repo for details.
