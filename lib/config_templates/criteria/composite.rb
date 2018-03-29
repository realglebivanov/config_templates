module ConfigTemplates::Criteria
  class Composite
    def initialize(*criteria)
      @criteria = criteria
    end

    def matches?(collection)
      @criteria.inject(true) do |result, criteria|
        result && criteria.matches?(collection)
      end
    end
  end
end
