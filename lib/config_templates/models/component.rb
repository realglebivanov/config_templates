module ConfigTemplates::Models
  class Component
    def initialize(template, context, validators, engines)
      @template = template
      @context = context
      @validators = validators
      @engines = engines
    end

    def destination
      engine.output_file_name @template.destination
    end

    def validate!
      unless validator.valid? render
        raise ::ConfigTemplates::Errors::InvalidTemplate, @template.path
      end
    end

    def render
      @render ||= engine.evaluate @template.content, @context
    end

    private

    def validator
      @validator ||= @validators.find_by_file_name @template.path
    end

    def engine
      @engine ||= @engines.find_by_extension @template.extension
    end
  end
end
