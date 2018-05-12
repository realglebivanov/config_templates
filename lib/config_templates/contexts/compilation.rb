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
      collection = ::ConfigTemplates::Collections::Components.new @criteria
      add_components_to collection
      collection
    end

    private

    def add_components_to(collection)
      @templates.find_all.each do |template|
        context = ::ConfigTemplates::Contexts::Rendering.new
        context.components = collection
        collection << component(template, context)
      end
    end

    def component(template, context)
      validator = @validators.find_by_file_name template.source_path
      engine = @engines.find_by_extension template.extension
      component = ::ConfigTemplates::Models::Component.new(template, context, validator, engine)
      context.component = component
    end
  end
end
