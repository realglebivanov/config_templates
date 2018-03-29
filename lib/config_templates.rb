require_relative 'autoload'

module ConfigTemplates
  class << self
    def configure
      yield config
    end

    def config
      @config ||= Config.new
    end
  end
end
