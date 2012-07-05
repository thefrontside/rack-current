# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rack-current/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["The Frontside Software"]
  gem.email         = ["info@thefrontside.net"]
  gem.description   = %q{Get the Currently running Rack::Request from anywhere inside the request-thread}
  gem.summary       = %q{Reach out and grab the current Rack::Request just by including CurrentRequest}
  gem.homepage      = "https://github.com/thefrontside/rack-current"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rack-current"
  gem.require_paths = ["lib"]
  gem.version       = CurrentRequest::VERSION

  gem.add_dependency 'rack'

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency 'rails', '~> 3.0'
end
