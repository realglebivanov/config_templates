module ConfigTemplates::Collections
  class Components
    def initialize(criteria)
      @criteria = criteria
      @components = {}
    end

    def <<(component)
      @components[component.source_path] = component
    end

    def find_all
      @criteria.filter(@components).lazy
        .reject { |_, component| component.child? }
        .map { |_, component| component }
    end

    def find_by_path!(path)
      find_by! ConfigTemplates::Criteria::Path.new path
    rescue
      raise ConfigTemplates::Errors::ComponentNotFound, path
    end

    def find_by!(criteria)
      criteria.filter(@components).first.last
    rescue
      raise ConfigTemplates::Errors::ComponentNotFound
    end
  end
end
