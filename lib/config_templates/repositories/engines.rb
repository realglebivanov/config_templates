module ConfigTemplates::Repositories
  class Engines
    def initialize
      @default = ::ConfigTemplates::Engines::Text.new
      @engines = { /^.*\.erb$/ => ::ConfigTemplates::Engines::ERB.new }
    end

    def add(engines)
      @engines.merge! engines
    end

    def find_by_extension(extension)
      find_by ::ConfigTemplates::Criteria::Name.new extension
    end

    def find_by(criteria)
      @engines.select { |(k, _)| criteria.matches?(k) }.first.last
    rescue
      @default
    end
  end
end
