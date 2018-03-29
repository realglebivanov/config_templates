module ConfigTemplates::Repositories
  class Templates
    def initialize
      @locator = ::ConfigTemplates::Locator.new
    end

    def find_all_by(criteria)
      @locator.templates.lazy
        .select { |filename| criteria.matches? filename }
        .map { |filename| ::ConfigTemplates::Models::Template.new filename }
    end
  end
end
