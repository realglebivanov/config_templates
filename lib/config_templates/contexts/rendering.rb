module ConfigTemplates::Contexts
  class Rendering
    include ::ConfigTemplates::Inject[
      'collections.extensions',
      'collections.settings',
      'config'
    ]

    attr_accessor :components

    def initialize(extensions, settings, config)
      @extensions = extensions
      @settings = settings
      @config = config
    end

    def binding
      ::Kernel.binding
    end

    def param(xpath, default = nil)
      xpath.split('.').reduce(@settings.find_all) { |value, key| value.fetch key }
    rescue
      default
    end

    def stage
      @config.stage
    end

    def method_missing(method_name, *args, &block)
      extension_class = @extensions.find_by_name method_name
      invocation = ::ConfigTemplates::Extensions::Invocation.new method_name, args, block
      extension_class.new.call(self, invocation) rescue super
    end

    def respond_to_missing?(method_name)
      @extensions.exists_with_name?(method_name) || super
    end
  end
end
