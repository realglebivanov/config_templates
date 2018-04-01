require_relative 'lib/config_templates/version'

Gem::Specification.new do |spec|
  spec.name        = 'config_templates'
  spec.version     = ConfigTemplates::VERSION
  spec.authors     = ['g.ivanov']
  spec.email       = ['g.ivanov@fun-box.ru']
  spec.summary     = 'config_templates'
  spec.description = spec.summary

  spec.files = Dir['lib/**/*']
  spec.test_files = Dir['spec/**/*']

  spec.add_dependency 'bundler'
  spec.add_dependency 'dry-auto_inject'
  spec.add_dependency 'dry-container'
  spec.add_dependency 'rake'
  spec.add_dependency 'rspec'
  spec.add_dependency 'rspec_junit_formatter'
end
