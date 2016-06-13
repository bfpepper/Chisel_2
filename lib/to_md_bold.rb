class ToMdBold

  def bold_notation(chunk)
    # binding.pry
    chunk.sub!("<strong>", "**")
    chunk.sub!("</strong>", "**")
  end

end
