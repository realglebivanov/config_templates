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

    def stage
      @config.stage
    end

    def method_missing(method_name)
      stage_request = method_name[-1] == '?'
      stage = method_name[0..-2] if stage_request
      stage.nil? ? super : stage?(stage)
    end

    def respond_to_missing?(method_name)
      method_name[-1] == '?' || super
    end

    private

    def stage?(stage)
      if @config.stages.include?(stage.to_sym)
        @config.stage == stage.to_sym
      else
        raise ::ConfigTemplates::Errors::StageNotFound, stage
      end
    end
  end
end
