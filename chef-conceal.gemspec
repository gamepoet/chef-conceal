# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chef/conceal/version'

Gem::Specification.new do |spec|
  spec.name          = 'chef-conceal'
  spec.version       = Chef::Conceal::VERSION
  spec.authors       = ['Ben Scott']
  spec.email         = ['gamepoet@gmail.com']
  spec.summary       = 'Adds a helper method to make decryption easier'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/gamepoet/chef-conceal'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency 'conceal', '~> 0.0'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake',   '>= 0.8.7'
end
