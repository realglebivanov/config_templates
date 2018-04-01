module ConfigTemplates::Contexts
  class Compilation
    include ConfigTemplates::Inject[
      'repositories.templates',
      'repositories.validators',
      'repositories.engines'
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
      @templates.find_all_by(@criteria).map do |template|
        ::ConfigTemplates::Models::Component.new template, context, @validators, @engines
      end
    end

    private

    def context
      ::ConfigTemplates::Contexts::Rendering.new
    end
  end
end
