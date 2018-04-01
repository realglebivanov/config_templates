module ConfigTemplates::Filesystem
  class Locator
    include ::ConfigTemplates::Inject['config']

    def templates
      ::Dir[::File.join(config.templates_path, '**', '*')].lazy.select { |path| ::File.file? path }
    end

    def settings
      ::Dir[
        ::File.join(config.settings_path, "#{config.settings_file_basename}.yml"),
        ::File.join(config.settings_path, "#{config.settings_file_basename}.#{config.stage}.yml")
      ]
    end
  end
end
