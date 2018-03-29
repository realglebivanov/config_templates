module ConfigTemplates::Engines
  class ERB
    def evaluate(template, context)
      ::ERB.new(template).result(context.instance_eval { binding })
    end
  end
end
