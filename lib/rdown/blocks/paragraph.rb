require "rdown/blocks/base"

module Rdown
  module Blocks
    class Paragraph < Base
      attr_reader :source

      # @param source [String]
      def initialize(source:)
        @source = source
      end
    end
  end
end
