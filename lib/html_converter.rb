require "./lib/chunk_maker"
require "./lib/paragraph"
require "./lib/bold"
require "./lib/italicized"
require "./lib/headers"
require "pry"

class HtmlConverter

  def translate(input)
    chunked_input = ChunkMaker.new.chunk(input)
    chunked_input.map do |chunk|
      if chunk.include?("#")
        Headers.new.header_notation(chunk)
      # binding.pry
      else
        Paragraph.new.para_notation(chunk)
      end
      if chunk.include?("**")
        Bold.new.bold_notation(chunk)
      end
      if chunk.include?("*")
        Italicized.new.italics(chunk)
        end
    end
    chunked_input.join("\n\n")
  end

end
