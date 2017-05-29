# Rdown

A toy Markdown-like language parser implementation in Ruby.

## Usage

```ruby
require "rdown"

source = <<MARKDOWN
# foo

bar

baz
MARKDOWN

parser = Rdown::Parser.new
ast = parser.parse(source)

renderer = Rdown::Renderer.new
renderer.render(ast) #=> "<h1>foo</h1><p>bar</p><p>baz</p>"
```
