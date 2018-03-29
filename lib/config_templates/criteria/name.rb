module ConfigTemplates::Criteria
  class Name
    def initialize(pattern, compare)
      @pattern = pattern
      @compare = compare
    end

    def matches?(target)
      @pattern.match?(target) == @compare
    end
  end
end
