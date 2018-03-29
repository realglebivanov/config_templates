module ConfigTemplates
  class Config
    attr_accessor :templates_path, :destination_path
    attr_accessor :settings_path, :settings_file_basename
    attr_accessor :stages
    attr_reader :stage

    def initialize
      @stages = []
      @outputs = ::ConfigTemplates::Repositories::Outputs.new
      @engines = ::ConfigTemplates::Repositories::Engines.new
      @validators = ::ConfigTemplates::Repositories::Validators.new
    end

    def stage=(stage)
      if stages.include? stage
        @stage = stage
      else
        raise ConfigTemplates::Errors::StageNotFound, stage.to_s
      end
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
