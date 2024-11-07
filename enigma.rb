require_relative "wiring"
require_relative "keyboard"
require_relative "lampboard"
require_relative "spindle"

class Enigma
  def initialize
    @keyboard = Keyboard.new
    @lampboard = Lampboard.new
    @spindle = Spindle.new
  end

  def cypher(message)
    message_characters = message.chars

    encyphered_characters = message_characters.map do |character|
      character_index = @keyboard.convert(character)
      shifted_index = @spindle.transform(character_index)
      @lampboard.convert(shifted_index)
    end

    encyphered_characters.join
  end
end
