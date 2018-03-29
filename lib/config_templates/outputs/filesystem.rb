module ConfigTemplates::Outputs
  class Filesystem
    def print(renderer)
      ::File.write renderer.template.destination, renderer.result
    end
  end
end
