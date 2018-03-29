module ConfigTemplates
  class Config
    attr_accessor :templates_path, :destination_path
    attr_accessor :settings_path, :settings_file
    attr_accessor :stage, :stages

    def initialize
      @stages = []
      @outputs = ::ConfigTemplates::Repositories::Outputs.new
      @engines = ::ConfigTemplates::Repositories::Engines.new
      @validators = ::ConfigTemplates::Repositories::Validators.new
    end

    def output(name)
      @outputs.find_by_name name
    end

    def outputs(outputs)
      @outputs.add outputs
    end

    def engine(extension)
      @engines.find_by_extension extension
    end

    def engines(engines)
      @engines.add engines
    end

    def validator(file_name)
      @validators.find_by_file_name file_name
    end

    def validators(validators)
      @validators.add validators
    end
  end
end
