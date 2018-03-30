module ConfigTemplates::Models
  class Template
    attr_reader :path

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
      engine.prepare_file_name ::File.join(
        @config.destination_path,
        @config.stage.to_s,
        @path.sub(@config.templates_path, '')
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
