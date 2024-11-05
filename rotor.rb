class Rotor
  def initialize(wiring)
    @wiring = wiring
  end

  def translate(index)
    @wiring.at(index)
  end
end
