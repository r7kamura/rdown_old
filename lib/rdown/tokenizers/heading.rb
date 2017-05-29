require "rdown/blocks/heading"
require "rdown/tokenizers/base"

module Rdown
  module Tokenizers
    class Heading < Base
      # @param source [String]
      # @return [Rdown::Blocks::Heading, nil]
      def call(source)
        if match_data = source.match(/\A(\#{1,6}) /)
          level = match_data[1].length
          block_source = begin
            index = source.index("\n")
            if index.nil?
              source.clone
            else
              source[0..index]
            end
          end
          ::Rdown::Blocks::Heading.new(
            level: level,
            source: block_source,
          )
        end
      end
    end
  end
end
