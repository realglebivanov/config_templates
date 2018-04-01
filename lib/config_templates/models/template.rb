module ConfigTemplates::Models
  class Template
    attr_reader :path

    def initialize(path, config)
      @path = path
      @config = config
    end

    def content
      @content ||= ::File.read @path
    end

    def extension
      ::File.extname @path
    end

    def destination
      ::File.join @config.destination_path, @config.stage.to_s, @path.sub(@config.templates_path, '')
    end
  end
end
