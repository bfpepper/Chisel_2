require "minitest/autorun"
require "minitest/nyan_cat"
require "./lib/md_converter"

class MdConverterTest < Minitest::Test

  def setup
    @converter = MdConverter.new
  end
  
  def test_it_can_create_a_new_class
    assert_instance_of MdConverter, @converter
  end

  def test_it_can_strip_headers
    input = "<h3>This is the header.</h3>\n\n"
    assert_equal "###This is the header.", @converter.translate(input)
  end

  def test_it_can_convert_html_paragraphs
    input = "<p>This is one</p>\n\n<p>This is two</p>"
    assert_equal "This is one\n\nThis is two", @converter.translate(input)
  end

  def test_it_can_convert_bold
    input = "<p><strong>This</strong> is one</p>\n\n<p>This is two</p>"
    assert_equal "**This** is one\n\nThis is two", @converter.translate(input)
  end

  def test_it_can_convert_italics
    input =  "<p><em>This</em> is one</p>\n\n<p><strong>This</strong> is two.</p>"
    assert_equal "*This* is one\n\n**This** is two.", @converter.translate(input)
  end

  def test_full_integration
    input = "<h1>This is one.</h3>\n\n<p><em>This</em> is <strong>two</strong>.</p>"
    assert_equal "#This is one.\n\n*This* is **two**.", @converter.translate(input)
  end

end
