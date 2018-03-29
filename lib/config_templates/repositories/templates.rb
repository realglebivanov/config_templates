module ConfigTemplates::Repositories
  class Templates
    def initialize
      @locator = ::ConfigTemplates::FileLocator.new
    end

    def find_all_by(criteria)
      @locator.templates
        .select { |filename| criteria.matches? filename }
        .map { |filename| ::ConfigTemplates::Models::Template.new filename }
    end
  end
end
