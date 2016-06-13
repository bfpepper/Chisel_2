class Paragraph

  def para_notation(chunk)
    chunk.insert(0, "<p>")
    chunk.insert(-1, "</p>")
  end

end
