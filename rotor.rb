class Rotor
  def initialize(key)
    @key = key
    @position = 0
  end

  def translate(index)
    step_adjusted_key.at(index)
  end

  def advance!
    @position += 1
    if @position >= @key.length
      @position = 0
      true
    else
      false
    end
  end

  private

  def step_adjusted_key
    @key.rotate(@position)
  end
end
