module ConfigTemplates::Contexts
  class Compilation
    def initialize
      @templates = ::ConfigTemplates::Repositories::Templates.new
      @settings = ::ConfigTemplates::Repositories::Settings.new
      @criteria = ::ConfigTemplates::Criteria::Composite.new
    end

    def criteria(criteria)
      @criteria = ::ConfigTemplates::Criteria::Composite.new @criteria, criteria
    end

    def renderers
      @templates.find_all_by(@criteria).map do |template|
        ::ConfigTemplates::Models::Renderer.new template, renderer_context
      end
    end

    private

    def renderer_context
      ::ConfigTemplates::Contexts::Renderer.new @settings
    end
  end
end
