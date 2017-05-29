require "rdown/nodes/base"

module Rdown
  module Nodes
    class Root < Base
      attr_reader :blocks

      # @param blocks [Array<Rdown::Blocks::Base>]
      def initialize(blocks:)
        @blocks = blocks
      end
    end
  end
end
