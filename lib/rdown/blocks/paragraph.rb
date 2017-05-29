require "rdown/blocks/base"

module Rdown
  module Blocks
    class Paragraph < Base
      attr_reader :source

      # @param source [String]
      def initialize(source:)
        @source = source
      end

      # @return [String]
      def content
        source.strip
      end
    end
  end
end
