module ConfigTemplates::Repositories
  class Validators
    def initialize
      @validators = {}
    end

    def add(validators)
      @validators.merge! validators
    end

    def find_by_file_name(file_name)
      ::ConfigTemplates::Validators::Composite.new(
        find_all_by ::ConfigTemplates::Criteria::Name.new file_name
      )
    end

    def find_all_by(criteria)
      @validators.select { |(k, _)| criteria.matches?(k) }.values
    end
  end
end
