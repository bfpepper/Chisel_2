require "./lib/chunk_maker"
require "./lib/to_md_paragraph"
require "pry"

class MdConverter

  def translate(input)
    chunked_input = ChunkMaker.new.chunk(input)
    chunked_input.map do |chunk|
      if chunk.include?("<p>")
        ToMdParagraph.new.para_notation(chunk)
      end
    end
    chunked_input.join("\n\n")
  end

end
