module ConfigTemplates::Criteria
  class Composite
    def initialize(*criteria)
      @criteria = criteria
    end

    def matches?(target)
      @criteria.inject(true) do |result, criteria|
        result && criteria.matches?(target)
      end
    end
  end
end
