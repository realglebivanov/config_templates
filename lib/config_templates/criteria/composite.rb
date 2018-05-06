module ConfigTemplates::Criteria
  class Composite
    def initialize(*criteria)
      @criteria = criteria
    end

    def filter(hash)
      @criteria.reduce({}) do |result, criteria|
        result.merge criteria.filter hash
      end
    end
  end
end
