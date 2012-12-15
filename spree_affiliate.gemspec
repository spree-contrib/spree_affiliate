# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY

  s.name        = 'spree_affiliate'
  s.version     = '1.0.1'
  s.authors     = ['Rails Dog']
  s.email       = 'gems@railsdog.com'
  s.homepage    = 'http://github.com/spree/spree_affiliate'
  s.summary     = 'Affiliate support for Spree'
  s.description = 'Affiliate support for Spree'
  s.required_ruby_version = '>= 1.8.7'
  s.rubygems_version      = '1.3.6'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency('spree_core', '~> 1.3.0.rc1')
  s.add_dependency('spree_auth_devise')
  # s.add_dependency('spree_store_credits', '~> 1.0.0')

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl_rails', '~> 1.7.0'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.7'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'debugger'
end
