require "./lib/chunk_maker"
require "./lib/to_html_paragraph"
require "./lib/to_html_bold"
require "./lib/to_html_italicized"
require "./lib/to_html_headers"
require "pry"

class HtmlConverter

  def translate(input)
    chunked_input = ChunkMaker.new.chunk(input)
    chunked_input.map do |chunk|
      if chunk.include?("#")
        ToHtmlHeaders.new.header_notation(chunk)
      else
        ToHtmlParagraph.new.para_notation(chunk)
      end
      if chunk.include?("**")
        ToHtmlBold.new.bold_notation(chunk)
      end
      if chunk.include?("*")
        ToHtmlItalicized.new.italics(chunk)
        end
    end
    chunked_input.join("\n\n")
  end

end
