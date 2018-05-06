module ConfigTemplates::Criteria
  class Path
    def initialize(path)
      @path = path
    end

    def filter(hash)
      hash.key?(@path) ? { @path => hash[@path] } : {}
    end
  end
end
