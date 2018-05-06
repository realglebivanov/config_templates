module Mocks
  module Outputs
    class Test
      attr_accessor :result

      def write(component)
        @result = component.render
      end
    end
  end
end
