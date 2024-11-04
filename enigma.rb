require_relative "wiring"

class Enigma
  ALPHABET = ("A".."Z").to_a

  def cypher(character)
    character_index = ALPHABET.index(character)

    shifted_index = ROTOR_I.at(character_index)
    shifted_index = ROTOR_II.at(shifted_index)
    shifted_index = ROTOR_III.at(shifted_index)

    ALPHABET.at(shifted_index)
  end
end
