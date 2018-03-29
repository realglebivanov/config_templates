module ConfigTemplates::Outputs
  class Stdout
    def print(renderer)
      ::Kernel.puts renderer.result
    end
  end
end
