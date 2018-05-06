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
        @templates.find_all.each do |template|
          context = ::ConfigTemplates::Contexts::Rendering.new
          context.components = collection
          collection << component(template, collection, context)
        end
      end
    end

    private

    def component(template, components, context)
      validator = @validators.find_by_file_name template.source_path
      engine = @engines.find_by_extension template.extension
      component = ::ConfigTemplates::Models::Component.new(template, context, validator, engine)
      context.component = component
    end
  end
end
