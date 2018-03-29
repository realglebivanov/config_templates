module ConfigTemplates::Outputs
  class Filesystem
    def print(renderer)
      destination = renderer.template.destination
      ::FileUtils.mkdir_p ::File.dirname destination
      ::File.write destination, renderer.render
    end
  end
end
