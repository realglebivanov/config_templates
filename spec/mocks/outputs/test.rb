module Mocks
  module Outputs
    class Test
      attr_accessor :result

      def print(renderer)
        @result = renderer.render
      end
    end
  end
end
