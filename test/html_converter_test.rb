require "minitest/autorun"
require "minitest/nyan_cat"
require "./lib/html_converter"

class ConverterTest < Minitest::Test

  def setup
    @converter = HtmlConverter.new
  end

  def test_it_can_create_a_new_class
    assert_instance_of HtmlConverter, @converter
  end

  def test_it_can_add_paragraph_notation
    input = "This is one\n\nThis is two"
    assert_equal "<p>This is one</p>\n\n<p>This is two</p>", @converter.translate(input)
  end

  def test_it_can_bold_words
    input = "**This** is one\n\nThis is two"
    assert_equal "<p><strong>This</strong> is one</p>\n\n<p>This is two</p>", @converter.translate(input)
  end

  def test_it_can_emphasize_words
    input = "*This* is one\n\n**This** is two."
    assert_equal "<p><em>This</em> is one</p>\n\n<p><strong>This</strong> is two.</p>", @converter.translate(input)
  end

  def test_it_can_handle_mixed_emphasis
    input = "*This **is** one*\n\n**This** is two."
    assert_equal "<p><em>This <strong>is</strong> one</em></p>\n\n<p><strong>This</strong> is two.</p>", @converter.translate(input)
  end

  def test_it_can_handle_headers
    input = "###This is the header.\n\n"
    assert_equal "<h3>This is the header.</h3>", @converter.translate(input)
  end

  def test_it_can_convert_headers_and_paragraphs
    input = "###This is the header.\n\nThis is two."
    assert_equal "<h3>This is the header.</h3>\n\n<p>This is two.</p>", @converter.translate(input)
  end

end
