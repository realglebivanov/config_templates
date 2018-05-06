module ConfigTemplates::Collections
  class Templates
    include ::ConfigTemplates::Inject['config', 'files.locator']

    def initialize(config, locator)
      @config = config
      @locator = locator
    end

    def find_all
      @locator.templates.map do |path|
        ::ConfigTemplates::Models::Template.new path, @config
      end
    end
  end
end
