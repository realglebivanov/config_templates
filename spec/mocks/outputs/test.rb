module Mocks
  module Outputs
    class Test
      attr_reader :result

      def print(renderer)
        @result = renderer.result
      end
    end
  end
end
