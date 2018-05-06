module ConfigTemplates::Extensions
  class Stage
    include ::ConfigTemplates::Inject['config']

    def initialize(config)
      @config = config
    end

    def call(_, invocation)
      check invocation.method[0..-2]
    end

    private

    def check(stage)
      if @config.stages.include?(stage.to_sym)
        @config.stage == stage.to_sym
      else
        raise ::ConfigTemplates::Errors::StageNotFound, stage
      end
    end
  end
end
