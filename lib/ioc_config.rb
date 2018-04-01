require 'dry-auto_inject'
require 'dry-container'

::ConfigTemplates::Inject = ::Dry::AutoInject(::ConfigTemplates.container).args

::ConfigTemplates.container.tap do |container|
  container.register(:config, memoize: true) { ::ConfigTemplates::Config.new }

  container.namespace :files do
    register(:locator, memoize: true) { ::ConfigTemplates::Filesystem::Locator.new }
  end

  container.namespace :repositories do
    register(:engines, memoize: true) { ::ConfigTemplates::Repositories::Engines.new }
    register(:outputs, memoize: true) { ::ConfigTemplates::Repositories::Outputs.new }
    register(:settings, memoize: true) { ::ConfigTemplates::Repositories::Settings.new }
    register(:templates, memoize: true) { ::ConfigTemplates::Repositories::Templates.new }
    register(:validators, memoize: true) { ::ConfigTemplates::Repositories::Validators.new }
  end
end
