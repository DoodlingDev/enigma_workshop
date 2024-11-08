require "minitest/autorun"
require_relative "enigma"
require_relative "keyboard"
require_relative "lampboard"
require_relative "spindle"
require_relative "reflector_spindle"
require_relative "rotor"
require_relative "wiring"

class Enigma::Test < Minitest::Test
  def test_encyphers_a_character
    test_rotor = Rotor.new([1, 0])
    enigma = Enigma.new(
      input: Keyboard.new,
      output: Lampboard.new,
      transformer: Spindle.new(test_rotor)
    )

    result = enigma.cypher("A")
    refute_equal "A", result
    assert_kind_of String, result
  end

  def test_encyphers_different_characters_for_each
    test_rotor = Rotor.new([2, 1, 0])
    enigma = Enigma.new(
      input: Keyboard.new,
      output: Lampboard.new,
      transformer: Spindle.new(test_rotor)
    )

    encyphered_character = enigma.cypher("A")
    refute_equal encyphered_character, enigma.cypher("B")
  end

  def test_will_encypher_differently_for_repeated_character
    test_rotor = Rotor.new([2, 1, 0])
    enigma = Enigma.new(
      input: Keyboard.new,
      output: Lampboard.new,
      transformer: Spindle.new(test_rotor)
    )

    first_encyphered_character = enigma.cypher("A")
    second_encyphered_character = enigma.cypher("A")
    refute_equal first_encyphered_character, second_encyphered_character
  end

  def test_encyphers_a_phrase
    rotor_i = Rotor.new(ROTOR_I)
    rotor_ii = Rotor.new(ROTOR_II)
    rotor_iii = Rotor.new(ROTOR_III)
    enigma = Enigma.new(
      input: Keyboard.new,
      output: Lampboard.new,
      transformer: Spindle.new(rotor_i, rotor_ii, rotor_iii)
    )

    encyphered_phrase = enigma.cypher("HELLOWORLD")
    assert_equal "IWLYOVBHFZ", encyphered_phrase
  end

  def test_encyphers_a_phrase_with_reflector
    rotor_i = Rotor.new(ROTOR_I)
    rotor_ii = Rotor.new(ROTOR_II)
    rotor_iii = Rotor.new(ROTOR_III)
    enigma = Enigma.new(
      input: Keyboard.new,
      output: Lampboard.new,
      transformer: ReflectorSpindle.new(rotor_i, rotor_ii, rotor_iii)
    )

    encyphered_phrase = enigma.cypher("HELLOWORLD")
    assert_equal "BORXECDZFQ", encyphered_phrase
  end

  def test_encyphers_and_decrypts_a_phrase
    rotor_i = Rotor.new(ROTOR_I)
    rotor_ii = Rotor.new(ROTOR_II)
    rotor_iii = Rotor.new(ROTOR_III)
    encypher_enigma = Enigma.new(
      input: Keyboard.new,
      output: Lampboard.new,
      transformer: ReflectorSpindle.new(rotor_i, rotor_ii, rotor_iii)
    )

    starting_phrase = "WETTERBERICHT"
    encyphered_phrase = encypher_enigma.cypher(starting_phrase)

    rotor_i = Rotor.new(ROTOR_I)
    rotor_ii = Rotor.new(ROTOR_II)
    rotor_iii = Rotor.new(ROTOR_III)
    decypher_enigma = Enigma.new(
      input: Keyboard.new,
      output: Lampboard.new,
      transformer: ReflectorSpindle.new(rotor_i, rotor_ii, rotor_iii)
    )

    decyphered_phrase = decypher_enigma.cypher(encyphered_phrase)
    assert_equal starting_phrase, decyphered_phrase
  end
end
