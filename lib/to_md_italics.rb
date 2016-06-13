class ToMdItalics

  def italics_notation(chunk)
    chunk.sub!("<em>", "*")
    chunk.sub!("</em>", "*")
  end

end
