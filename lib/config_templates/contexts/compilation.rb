module ConfigTemplates::Contexts
  class Compilation
    include ConfigTemplates::Inject[
      'collections.templates',
      'collections.validators',
      'collections.engines'
    ]

    def initialize(templates, validators, engines)
      @templates = templates
      @validators = validators
      @engines = engines
      @criteria = ::ConfigTemplates::Criteria::Composite.new
    end

    def criteria(criteria)
      @criteria = ::ConfigTemplates::Criteria::Composite.new @criteria, criteria
    end

    def components
      ::ConfigTemplates::Collections::Components.new(@criteria).tap do |collection|
        context = ::ConfigTemplates::Contexts::Rendering.new
        context.components = collection
        @templates.find_all.each { |template| collection << component(template, context) }
      end
    end

    private

    def component(template, context)
      validator = @validators.find_by_file_name template.source_path
      engine = @engines.find_by_extension template.extension
      ::ConfigTemplates::Models::Component.new template, context, validator, engine
    end
  end
end
