module ConfigTemplates::Contexts
  class Renderer
    def initialize(settings)
      @settings = settings
      @config = ::ConfigTemplates.config
    end

    def param(path, default = nil)
      path.split('.').inject(@settings.find_all) { |value, current| value[current] }
    rescue
      default
    end

    def stage?(stage)
      if @config.stages.include? stage
        @config.stage == stage.to_sym
      else
        raise ::ConfigTemplates::Errors::StageNotFound, stage.to_s
      end
    end
  end
end
