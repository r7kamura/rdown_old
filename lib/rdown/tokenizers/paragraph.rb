require "rdown/blocks/paragraph"
require "rdown/tokenizers/base"

module Rdown
  module Tokenizers
    class Paragraph < Base
      # @param source [String]
      # @return [Rdown::Blocks::Paragraph, nil]
      def call(source)
        block_source = begin
          if index = source.index("\n\n")
            source[0..index]
          else
            source.clone
          end
        end
        ::Rdown::Blocks::Paragraph.new(source: block_source)
      end
    end
  end
end
