class Enigma
  def initialize(input:, output:, transformer:)
    @input = input
    @output = output
    @transformer = transformer
  end

  def cypher(message)
    message_characters = message.chars

    encyphered_characters = message_characters.map do |character|
      character_index = @input.convert(character)
      shifted_index = @transformer.call(character_index)
      @output.convert(shifted_index)
    end

    encyphered_characters.join
  end
end
