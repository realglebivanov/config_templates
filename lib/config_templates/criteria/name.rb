module ConfigTemplates::Criteria
  class Name
    def initialize(pattern, straight = true)
      @pattern = pattern
      @straight = straight
    end

    def matches?(expression)
      @pattern.match?(cast expression) && @straight
    end

    def cast(expression)
      if expression.is_a?(::String) || expression.is_a?(::Regexp)
        expression
      else
        expression.to_s
      end
    end
  end
end
