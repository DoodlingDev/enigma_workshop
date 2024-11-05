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

  def test_will_encypher_differently_for_repeated_character
    enigma = Enigma.new
    first_encyphered_character = enigma.cypher("A")
    second_encyphered_character = enigma.cypher("A")
    refute_equal first_encyphered_character, second_encyphered_character
  end

  def test_encyphers_a_phrase
    enigma = Enigma.new
    encyphered_phrase = enigma.cypher("HELLOWORLD")
    assert_equal "IPNNYTYENR", encyphered_phrase
  end
end
