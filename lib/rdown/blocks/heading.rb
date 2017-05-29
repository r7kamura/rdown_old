require "rdown/blocks/base"

module Rdown
  module Blocks
    class Heading < Base
      attr_reader :level
      attr_reader :source

      # @param level [Integer]
      # @param source [String]
      def initialize(level:, source:)
        @level = level
        @source = source
      end

      # @return [String]
      def content
        source[level + 1 .. -1].strip
      end
    end
  end
end
