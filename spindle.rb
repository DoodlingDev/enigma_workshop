require_relative "rotor"
require_relative "wiring"

class Spindle
  def initialize
    @rotor_one = Rotor.new(ROTOR_I)
    @rotor_two = Rotor.new(ROTOR_II)
    @rotor_three = Rotor.new(ROTOR_III)
  end

  def transform(index)
    shifted_index = @rotor_one.translate(index)
    shifted_index = @rotor_two.translate(shifted_index)
    shifted_index = @rotor_three.translate(shifted_index)

    if @rotor_one.advance!
      if @rotor_two.advance!
        @rotor_three.advance!
      end
    end

    shifted_index
  end
end
