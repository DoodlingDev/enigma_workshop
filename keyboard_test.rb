require "minitest/autorun"
require_relative "keyboard"

class Keyboard::Test < Minitest::Test
  def test_converts_character_to_index
    keyboard = Keyboard.new
    index = keyboard.convert("A")
    assert_equal 0, index
  end

  def test_converts_different_character_to_index
    keyboard = Keyboard.new
    index = keyboard.convert("Z")
    assert_equal 25, index
  end
end
