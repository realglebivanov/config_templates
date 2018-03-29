module ConfigTemplates::Models
  class Renderer
    attr_reader :template

    def initialize(template, context)
      @template = template
      @context = context
    end

    def validate!
      @template.validator.validate! render
    end

    def render
      @render ||= @template.engine.evaluate @template.content, @context
    end
  end
end
