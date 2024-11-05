class Rotor
  def initialize(key)
    @key = key
    @position = 0
  end

  def translate(index)
    cyphertext = step_adjusted_key.at(index)
    advance!
    cyphertext
  end

  def advance!
    @position += 1
    if @position >= @key.length
      @position = 0
    end
  end

  private

  def step_adjusted_key
    @key.rotate(@position)
  end
end
