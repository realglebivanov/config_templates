module ConfigTemplates::Outputs
  class Filesystem
    def print(component)
      destination = component.destination
      ::FileUtils.mkdir_p ::File.dirname destination
      ::File.write destination, component.render
    end
  end
end
