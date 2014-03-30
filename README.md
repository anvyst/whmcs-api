# whmcs-ruby

whmcs-ruby provides Ruby bindings for the [WHMCS API](http://docs.whmcs.com/API#External_API).


## Usage

```ruby
    require 'whmcs'

    WHMCS.configure do |config|
      config.api_url      = 'http://example.com/includes/api.php'
      config.api_username = 'someusername'
      config.api_password = 'c4ca4238a0b923820dcc509a6f75849b' # md5 hash
	  # optionally add access key
	  config.api_key = 'YetAnotherAPIAccessKeyForWHMCS'

	end

    WHMCS::Client.get_clients_details(:clientid => '1')
```

See the [documentation](http://jujav4ik.github.io/whmcs-api) for more details.


## Installation

```ruby
    gem install whmcs-api
```

## Copyright

Copyright (c) 2014 anvyst.com, see LICENSE in this repo for details.
Copyright (c) 2011 DotBlock.com, see LICENSE in this repo for details.
