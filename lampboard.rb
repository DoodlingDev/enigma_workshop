class Lampboard
  ALPHABET = ("A".."Z").to_a

  def convert(index)
    ALPHABET.at(index)
  end
end
