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

  def cypher(message)
    message_characters = message.chars

    encyphered_characters = message_characters.map do |character|
      character_index = @keyboard.convert(character)
      shifted_index = encypher_index(character_index)
      advance_rotors
      @lampboard.convert(shifted_index)
    end

    encyphered_characters.join
  end

  private

  def encypher_index(index)
    shifted_index = @rotor_one.translate(index)
    shifted_index = @rotor_two.translate(shifted_index)
    @rotor_three.translate(shifted_index)
  end

  def advance_rotors
    if @rotor_one.advance!
      if @rotor_two.advance!
        @rotor_three.advance!
      end
    end
  end
end
