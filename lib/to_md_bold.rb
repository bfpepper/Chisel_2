class ToMdBold

  def bold_notation(chunk)
    binding.pry
    chunk.delete("<strong>")
    chunk.delete("</strong>")
  end

end
