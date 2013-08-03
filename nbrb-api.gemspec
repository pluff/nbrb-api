# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nbrb-api/version'

Gem::Specification.new do |gem|
  gem.name          = "nbrb-api"
  gem.version       = Nbrb::Api::VERSION
  gem.authors       = ["Pavel Shutin"]
  gem.email         = ["publicshady@gmail.com"]
  gem.description   = %q{This gem provides convenient way to interact with web API of National Bank of the Republic Belarus. }
  gem.summary       = %q{Ruby wrapper for National Bank of the Republic Belarus web service API}
  gem.homepage      = ""

  gem.add_dependency 'savon'

  gem.add_development_dependency 'rspec', '>= 2.14.1'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'pry'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
