module ConfigTemplates::Repositories
  class Settings
    def initialize
      @locator = ::ConfigTemplates::FileLocator.new
    end

    def find_all
      @find_all ||= @locator.settings.reduce({}) {
        |result, current| result.merge ::YAML.load_file current, Hash.new
      }
    end
  end
end
