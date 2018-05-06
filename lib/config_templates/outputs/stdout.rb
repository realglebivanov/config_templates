module ConfigTemplates::Outputs
  class Stdout
    def write(component)
      ::Kernel.puts component.render
    end
  end
end
