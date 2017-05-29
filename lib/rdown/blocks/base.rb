module Rdown
  module Blocks
    class Base
      # @return [String]
      def type
        self.class.to_s.split("::").last
      end
    end
  end
end
