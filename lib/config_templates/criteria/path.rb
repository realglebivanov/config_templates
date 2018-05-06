module ConfigTemplates::Criteria
  class Path
    def initialize(path, relative_to)
      @path = path
      @relative_to = relative_to
    end

    def filter(hash)
      if @path.start_with? '@'
        with_absolute_path hash
      else
        with_relative_path hash
      end
    end

    private

    def with_absolute_path(hash)
      hash.key?(@path.sub!('@', '')) ? { @path => hash[@path] } : {}
    end

    def with_relative_path(hash)
      hash.key?(relative_path) ? { relative_path => hash[relative_path] } : {}
    end

    def relative_path
      @relative_path ||= ::File.join(::File.dirname(@relative_to), @path)
    end
  end
end
