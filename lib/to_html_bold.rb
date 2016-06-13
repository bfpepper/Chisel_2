class ToHtmlBold

  def bold_notation(chunk)
    while chunk.include? "**"
      chunk.sub!("**", "<strong>")
      chunk.sub!("**", "</strong>")
    end
    chunk
  end

end
