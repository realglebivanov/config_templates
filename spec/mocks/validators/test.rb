module Mocks
  module Validators
    class Test
      attr_accessor :valid

      def initialize
        @valid = true
      end

      def valid?(_)
        @valid
      end
    end
  end
end
