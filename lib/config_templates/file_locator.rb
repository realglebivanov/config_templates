module ConfigTemplates
  class FileLocator
    def initialize
      @config = ::ConfigTemplates.config
    end

    def templates
      ::Dir[::File.join(@config.templates_path, '**', '*')].lazy.select { |path| ::File.file? path }
    end

    def settings
      ::Dir[
        ::File.join(@config.settings_path, "#{@config.settings_file_basename}.yml"),
        ::File.join(@config.settings_path, "#{@config.settings_file_basename}.#{@config.stage}.yml")
      ]
    end
  end
end
