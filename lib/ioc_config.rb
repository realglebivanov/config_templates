require 'dry-auto_inject'
require 'dry-container'

::ConfigTemplates::Inject = ::Dry::AutoInject(::ConfigTemplates.container).args

::ConfigTemplates.container.tap do |container|
  container.register(:config, memoize: true) { ::ConfigTemplates::Config.new }

  container.namespace :files do
    register(:locator, memoize: true) { ::ConfigTemplates::Filesystem::Locator.new }
  end

  container.namespace :collections do
    register(:engines, memoize: true) { ::ConfigTemplates::Collections::Engines.new }
    register(:outputs, memoize: true) { ::ConfigTemplates::Collections::Outputs.new }
    register(:settings, memoize: true) { ::ConfigTemplates::Collections::Settings.new }
    register(:templates, memoize: true) { ::ConfigTemplates::Collections::Templates.new }
    register(:validators, memoize: true) { ::ConfigTemplates::Collections::Validators.new }
    register(:extensions, memoize: true) { ::ConfigTemplates::Collections::Extensions.new }
  end
end
