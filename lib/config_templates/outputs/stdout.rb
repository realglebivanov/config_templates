module ConfigTemplates::Outputs
  class Stdout
    def print(renderer)
      ::Kernel.puts renderer.render
    end
  end
end
