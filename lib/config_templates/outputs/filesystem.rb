module ConfigTemplates::Outputs
  class Filesystem
    def write(component)
      destination_path = component.destination_path
      ::FileUtils.mkdir_p ::File.dirname destination_path
      ::File.write destination_path, component.render
    end
  end
end
