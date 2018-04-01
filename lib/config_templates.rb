require 'erb'
require 'yaml'
require 'fileutils'

module ConfigTemplates
  def self.configure
    yield container.resolve(:config)
  end

  def self.container
    @container ||= ::Dry::Container.new
  end
end

require_relative 'ioc_config'
require_relative 'autoload'
