require "./lib/chunk_maker"
require "./lib/to_md_paragraph"
require "./lib/to_md_header"
require "./lib/to_md_bold"
require "pry"

class MdConverter

  def translate(input)
    chunked_input = ChunkMaker.new.chunk(input)
    chunked_input.map do |chunk|
      if chunk.include?("<h")
        ToMdHeader.new.header_notation(chunk)
      elsif chunk.include?("<p>")
        ToMdParagraph.new.para_notation(chunk)
      end
      if chunk.include?("<strong>")
        ToMdBold.new.bold_notation(chunk)
      end
    end
    chunked_input.join("\n\n")
  end

end
