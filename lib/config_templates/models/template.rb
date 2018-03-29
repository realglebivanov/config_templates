module ConfigTemplates::Models
  class Template
    def initialize(path)
      @path = path
      @config = ::ConfigTemplates.config
    end

    def content
      @content ||= ::File.read @path
    end

    def extension
      ::File.extname @path
    end

    def destination
      ::File.join(
        @config.destination_path,
        @config.stage.to_s,
        @path.sub(@config.templates_path, '').sub(extension, '')
      )
    end

    def validator
      @config.validator @path
    end

    def engine
      @config.engine extension
    end
  end
end
