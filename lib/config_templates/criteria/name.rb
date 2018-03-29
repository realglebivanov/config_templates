module ConfigTemplates::Criteria
  class Name
    def initialize(pattern, override = true)
      @pattern = pattern
      @override = override
    end

    def matches?(target)
      @pattern.match?(target) && @override
    end
  end
end
