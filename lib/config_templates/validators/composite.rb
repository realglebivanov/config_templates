module ConfigTemplates::Validators
  class Composite
    def initialize(*validators)
      @validators = validators
    end

    def validate!
      @validators.each(&:validate!)
    end
  end
end
