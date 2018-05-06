module ConfigTemplates::Errors
  class StageNotFound < RuntimeError; end
  class ComponentNotFound < RuntimeError; end
  class InvalidTemplate < RuntimeError; end
end
