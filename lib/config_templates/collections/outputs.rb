module ConfigTemplates::Collections
  class Outputs
    def initialize
      @default = :stdout
      @outputs = {
        stdout: ::ConfigTemplates::Outputs::Stdout.new,
        filesystem: ::ConfigTemplates::Outputs::Filesystem.new
      }
    end

    def add(outputs)
      @outputs.merge! outputs
    end

    def find_by_name(name)
      @outputs.fetch(name) { @outputs[@default] }
    end
  end
end
