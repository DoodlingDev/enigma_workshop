require "minitest/autorun"
require_relative "lampboard"

class Lampboard::Test < Minitest::Test
  def test_converts_character_to_index
    lampboard = Lampboard.new
    letter = lampboard.convert(0)
    assert_equal "A", letter
  end

  def test_converts_different_character_to_index
    lampboard = Lampboard.new
    letter = lampboard.convert(25)
    assert_equal "Z", letter
  end
end
