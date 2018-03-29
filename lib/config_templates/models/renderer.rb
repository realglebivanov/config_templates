module ConfigTemplates::Models
  class Renderer
    attr_reader :template

    def initialize(template, context)
      @template = template
      @context = context
    end

    def validate!
      @template.validator.validate!
    end

    def result
      @result ||= @template.engine.evaluate @template.content, @context
    end
  end
end
