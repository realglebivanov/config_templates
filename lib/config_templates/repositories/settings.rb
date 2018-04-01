module ConfigTemplates::Repositories
  class Settings
    include ::ConfigTemplates::Inject['files.locator']

    def initialize(locator)
      @locator = locator
    end

    def find_all
      @find_all ||= @locator.settings.reduce({}) {
        |result, current| result.merge ::YAML.load_file current, Hash.new
      }
    end
  end
end
