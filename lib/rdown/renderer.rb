module Rdown
  class Renderer
    # @param options [Hash]
    def initialize(options = {})
      @options = options
    end

    # @param node [Rdown::Nodes::Base, Rdown::Block::Base]
    def render(node)
      case node
      when ::Rdown::Nodes::Root
        render_root(node)
      when ::Rdown::Blocks::Heading
        render_heading(node)
      when ::Rdown::Blocks::Paragraph
        render_paragraph(node)
      end
    end

    private

    # @param block [Rdown::Blocks::Heading]
    def render_heading(block)
      element_name = "h#{block.level}"
      "<#{element_name}>#{block.content}</#{element_name}>"
    end

    # @param block [Rdown::Blocks::Paragraph]
    def render_paragraph(block)
      "<p>#{block.content}</p>"
    end

    # @param node [Rdown::Nodes::Root]
    def render_root(node)
      node.blocks.map do |block|
        render(block)
      end.join
    end
  end
end
