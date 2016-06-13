class ToMdParagraph

  def para_notation(chunk)
    chunk.slice!(0..2)
    chunk.slice!(-4..-1)
  end

end
