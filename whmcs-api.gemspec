$:.unshift 'lib'

require 'whmcs/version'

Gem::Specification.new do |s|
  s.name             = 'whmcs-api'
  s.version          = WHMCS::Version
  s.date             = Time.now.strftime('%Y-%m-%d')
  s.summary          = 'whmcs-api: Ruby bindings for the WHMCS API'
  s.homepage         = 'https://github.com/anvyst/whmcs-api'
  s.authors          = ['Andrey Vystavkin']
  s.email            = 'andrey.vystavkin@gmail.com'

  s.files            = %w[ Rakefile README.md ]

  s.files           += Dir['lib/**/*']
  s.files           += Dir['test/**/*']

  s.add_dependency('crack', '> 0.1.8')
  s.add_development_dependency('shoulda')

  s.extra_rdoc_files = ['README.md']
  s.rdoc_options     = ["--charset=UTF-8"]

  s.description = "whmcs-api: Ruby bindings for the WHMCS API"
end
