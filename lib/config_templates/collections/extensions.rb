module ConfigTemplates::Collections
  class Extensions
    def initialize
      @extensions = {
        /^.+\?$/ => ::ConfigTemplates::Extensions::Stage,
        'include' => ::ConfigTemplates::Extensions::Include
      }
    end

    def add(extensions)
      @extensions.merge! extensions
    end

    def exists_with_name?(name)
      find_by_name(name) != nil
    end

    def find_by_name(name)
      find_by ::ConfigTemplates::Criteria::Name.new name
    end

    def find_by(criteria)
      criteria.filter(@extensions).first.last
    rescue
      nil
    end
  end
end
