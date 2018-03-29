module ConfigTemplates::Errors
  class EngineNotFound < RuntimeError; end
  class StageNotFound < RuntimeError; end
  class InvalidTemplate < RuntimeError; end
end
