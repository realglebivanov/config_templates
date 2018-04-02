module Mocks
  module Outputs
    class Test
      attr_accessor :result

      def print(component)
        @result = component.render
      end
    end
  end
end
