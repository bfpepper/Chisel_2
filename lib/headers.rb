class Headers

  def header_notation(chunk)
    hash_num = chunk.count("#")
    output = chunk.delete("#")
    chunk.sub!("#" * hash_num, "<h#{hash_num}>")
    chunk.insert(-1, "</h#{hash_num}>")
  end

end
