# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'one_off/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'one_off'
  spec.version     = OneOff::VERSION
  spec.authors     = ['Hamed Asghari']
  spec.email       = ['hasghari@g2.com']
  spec.homepage    = 'https://github.com/g2crowd/one_off'
  spec.summary     = 'A Rails plugin with a generator to create one off scripts'
  spec.description = 'A Rails plugin that creates a one_off script to be executed when code is deployed to production'
  spec.license     = 'MIT'
  spec.required_ruby_version = '~> 2.7'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 6.0.3', '>= 6.0.2.1'

  spec.add_development_dependency 'fivemat'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'rspec_junit_formatter', '0.4.1'
  spec.add_development_dependency 'rspec-rails', '~> 3.9'
  spec.add_development_dependency 'simplecov', '0.16.1'
end
