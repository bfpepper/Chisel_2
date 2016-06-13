class ToMdHeader

  def header_notation(chunk)
    header_num = chunk[2].to_i
    chunk.slice!(0..3)
    chunk.slice!(-5..-1)
    chunk.insert(0, "#" * header_num)
  end

end
