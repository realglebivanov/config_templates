module ConfigTemplates::Repositories
  class Templates
    include ::ConfigTemplates::Inject['config', 'files.locator']

    def initialize(config, locator)
      @config = config
      @locator = locator
    end

    def find_all_by(criteria)
      @locator.templates
        .select { |filename| criteria.matches? filename }
        .map { |filename| ::ConfigTemplates::Models::Template.new filename, @config }
    end
  end
end
