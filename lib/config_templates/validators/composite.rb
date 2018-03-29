module ConfigTemplates::Validators
  class Composite
    def initialize(*validators)
      @validators = validators
    end

    def validate!(result)
      @validators.each { |validator| validator.validate! result }
    end
  end
end
