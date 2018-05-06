module ConfigTemplates::Extensions
  class Invocation
    attr_reader :method, :args, :block

    def initialize(method, args, block)
      @method = method
      @args = args
      @block = block
    end
  end
end
