require_relative "wiring"
require_relative "keyboard"
require_relative "lampboard"
require_relative "rotor"

class Enigma
  def initialize
    @keyboard = Keyboard.new
    @lampboard = Lampboard.new
    @rotor_one = Rotor.new(ROTOR_I)
    @rotor_two = Rotor.new(ROTOR_II)
    @rotor_three = Rotor.new(ROTOR_III)
  end

  def cypher(character)
    character_index = @keyboard.convert(character)

    shifted_index = @rotor_one.translate(character_index)
    shifted_index = @rotor_two.translate(shifted_index)
    shifted_index = @rotor_three.translate(shifted_index)

    @lampboard.convert(shifted_index)
  end
end
