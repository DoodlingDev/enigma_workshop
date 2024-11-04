require "minitest/autorun"
require_relative "enigma"

class Enigma::Test < Minitest::Test
  def test_encyphers_a_character
    enigma = Enigma.new
    result = enigma.cypher("A")
    refute_equal "A", result
    assert_kind_of String, result
  end

  def test_encyphers_different_characters_for_each
    enigma = Enigma.new
    encyphered_character = enigma.cypher("A")
    refute_equal encyphered_character, enigma.cypher("B")
  end
end
