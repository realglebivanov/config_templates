module ConfigTemplates::Outputs
  class Stdout
    def print(component)
      ::Kernel.puts component.render
    end
  end
end
