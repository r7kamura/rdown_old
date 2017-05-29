require "rdown/nodes/root"
require "rdown/tokenizers/paragraph"

module Rdown
  class Parser
    # @param options [Hash]
    def initialize(options = {})
      @options = options
    end

    # @param source [String]
    # @return [Rdown::Node]
    def parse(source)
      blocks = []
      until source.empty? do
        tokenizers.each do |tokenizer|
          block = tokenizer.call(source)
          unless block.nil?
            blocks << block
            source = source[block.source.length..-1]
            break
          end
        end
      end
      ::Rdown::Nodes::Root.new(blocks: blocks)
    end

    private

    # @return [Array<Rdown::Tokenizers::BaseTokenizer>]
    def tokenizers
      @tokenizers ||= [
        ::Rdown::Tokenizers::Paragraph.new,
      ]
    end
  end
end
