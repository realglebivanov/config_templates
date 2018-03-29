module ConfigTemplates
  class Locator
    def initialize
      @config = ::ConfigTemplates.config
    end

    def templates
      ::Dir[::File.join(@config.templates_path, '**', '*')]
    end

    def settings
      ::Dir[
        ::File.join(@config.settings_path, "#{@config.settings_file}.yml"),
        ::File.join(@config.settings_path, "#{@config.settings_file}.#{@config.stage}.yml")
      ]
    end
  end
end
