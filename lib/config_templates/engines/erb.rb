module ConfigTemplates::Engines
  class ERB
    def evaluate(template, context)
      ::ERB.new(template).result context.binding
    end

    def destination_path(path)
      path.sub '.erb', ''
    end
  end
end
