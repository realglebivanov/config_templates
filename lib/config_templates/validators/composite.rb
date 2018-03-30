module ConfigTemplates::Validators
  class Composite
    def initialize(validators)
      @validators = validators
    end

    def valid?(view)
      @validators.inject(true) do |result, validator|
        result && validator.valid?(view)
      end
    end
  end
end
