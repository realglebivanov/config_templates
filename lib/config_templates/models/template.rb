module ConfigTemplates::Models
  class Template
    attr_reader :source_path

    def initialize(source_path, config)
      @source_path = source_path
      @config = config
    end

    def content
      @content ||= ::File.read @source_path
    end

    def extension
      ::File.extname @source_path
    end

    def destination_path
      ::File.join @config.destination_path, @config.stage.to_s, @source_path.sub(@config.templates_path, '')
    end
  end
end
