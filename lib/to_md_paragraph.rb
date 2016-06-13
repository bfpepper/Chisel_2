class ToMdParagraph

  def para_notation(chunk)
    paragraph_deleted = chunk.delete("<p>")
    slash_deleted = paragraph_deleted.delete("/")
    slash_deleted
    binding.pry
  end

end
