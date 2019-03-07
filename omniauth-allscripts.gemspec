# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-allscripts/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-allscripts"
  gem.version       = OmniAuth::AllScripts::VERSION
  gem.authors       = ["Eric Shelley"]
  gem.email         = ["eric@webdesignbakery.com"]
  gem.description   = %q{AllScripts OAuth2 strategy for OmniAuth.}
  gem.summary       = %q{AllScripts OAuth2 strategy for OmniAuth.}
  gem.homepage      = "https://github.com/bartimaeus/omniauth-allscripts"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'

  gem.add_development_dependency 'bundler', '>= 1.16', '< 3.0'
  gem.add_development_dependency 'rake', '~> 12.3'

  gem.add_development_dependency 'rspec', '~> 3.6'
  gem.add_development_dependency 'simplecov', '~> 0.16'
end