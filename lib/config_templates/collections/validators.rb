module ConfigTemplates::Collections
  class Validators
    def initialize
      @validators = {}
    end

    def add(validators)
      @validators.merge! validators
    end

    def find_by_file_name(file_name)
      ::ConfigTemplates::Validators::Composite.new find_all_by_file_name file_name
    end

    def find_all_by_file_name(file_name)
      find_all_by ::ConfigTemplates::Criteria::Name.new file_name
    end

    def find_all_by(criteria)
      criteria.filter(@validators).values
    end
  end
end
