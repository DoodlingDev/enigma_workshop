class Keyboard
  ALPHABET = ("A".."Z").to_a

  def convert(character)
    ALPHABET.index(character)
  end
end
