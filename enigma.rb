require_relative "wiring"

class Enigma
  ALPHABET = ("A".."Z").to_a

  def cypher(character)
    character_index = ALPHABET.index(character)

    shifted_index = translate(ROTOR_I, character_index)
    shifted_index = translate(ROTOR_II, shifted_index)
    shifted_index = translate(ROTOR_III, shifted_index)

    ALPHABET.at(shifted_index)
  end

  private

  def translate(rotor, index)
    rotor.at(index)
  end
end
