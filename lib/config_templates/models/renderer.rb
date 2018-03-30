module ConfigTemplates::Models
  class Renderer
    attr_reader :template

    def initialize(template, context)
      @template = template
      @context = context
    end

    def validate!
      unless @template.validator.valid? render
        raise ::ConfigTemplates::Errors::InvalidTemplate, @template.path
      end
    end

    def render
      @render ||= @template.engine.evaluate @template.content, @context
    end
  end
end
