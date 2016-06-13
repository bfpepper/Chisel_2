require "./lib/html_converter"

class Chisel
  input_file = ARGV[0]
  output_file = ARGV[1]

  input = File.read(input_file)

  if input_file.end_with?(".md")
      converted_to_html = HtmlConverter.new.translate(input)
      File.write(output_file, converted_to_html)
    elsif input_file.end_with?(".html")
      converted_to_md = MdConverter.new.translate(input)
      File.write(output_file, converted_to_md)
    else
      "Not a supported file"
  end

  input_lines = input_file.lines.count
  output_lines = output_file.lines.count
  puts "Converted #{input_file} (#{input_lines} lines) to #{output_file} (#{output_lines} lines)"
end
