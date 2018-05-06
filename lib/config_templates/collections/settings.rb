module ConfigTemplates::Collections
  class Settings
    include ::ConfigTemplates::Inject['files.locator']

    def initialize(locator)
      @locator = locator
    end

    def find_all
      @find_all ||= @locator.settings.reduce({}) do |result, current|
        ::DeepMerge.deep_merge! ::YAML.load_file(current, Hash.new), result
      end
    end
  end
end
