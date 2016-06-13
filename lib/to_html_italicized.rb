class ToHtmlItalicized

  def italics(chunk)
    while chunk.include?("*")
      chunk.sub!("*", "<em>")
      chunk.sub!("*", "</em>")
    end
  end

end
