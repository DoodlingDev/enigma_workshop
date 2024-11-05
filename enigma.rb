require_relative "wiring"
require_relative "keyboard"
require_relative "lampboard"

class Enigma
  def initialize
    @keyboard = Keyboard.new
    @lampboard = Lampboard.new
  end

  def cypher(character)
    character_index = @keyboard.convert(character)

    shifted_index = translate(ROTOR_I, character_index)
    shifted_index = translate(ROTOR_II, shifted_index)
    shifted_index = translate(ROTOR_III, shifted_index)

    @lampboard.convert(shifted_index)
  end

  private

  def translate(rotor, index)
    rotor.at(index)
  end
end
