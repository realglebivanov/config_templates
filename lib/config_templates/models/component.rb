module ConfigTemplates::Models
  class Component
    def initialize(template, context, validator, engine)
      @template = template
      @context = context
      @validator = validator
      @engine = engine
      @child = false
    end

    def child?
      @child
    end

    def child!
      @child = true
    end

    def source_path
      @template.source_path
    end

    def destination_path
      @engine.destination_path @template.destination_path
    end

    def validate!
      unless @validator.valid? render
        raise ::ConfigTemplates::Errors::InvalidTemplate, source_path
      end
    end

    def render
      @render ||= @engine.evaluate @template.content, @context
    end
  end
end
