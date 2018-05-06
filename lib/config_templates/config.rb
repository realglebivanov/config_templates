module ConfigTemplates
  class Config
    include ConfigTemplates::Inject[
      'collections.extensions',
      'collections.validators',
      'collections.engines',
      'collections.outputs'
    ]

    attr_accessor :templates_path, :destination_path
    attr_accessor :settings_path, :settings_file_basename
    attr_accessor :stages
    attr_reader :stage

    def initialize(extensions, validators, engines, outputs)
      @stages = []
      @engines = engines
      @outputs = outputs
      @validators = validators
      @extensions = extensions
    end

    def stage=(stage)
      if stages.include? stage
        @stage = stage
      else
        raise ConfigTemplates::Errors::StageNotFound, stage.to_s
      end
    end

    def outputs(outputs)
      @outputs.add outputs
    end

    def engines(engines)
      @engines.add engines
    end

    def validators(validators)
      @validators.add validators
    end

    def extensions(extensions)
      @extensions.add extensions
    end
  end
end
