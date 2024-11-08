require_relative "wiring"

class ReflectorSpindle
  def initialize(*rotors)
    @rotors = rotors
  end

  def call(index)
    transformed_index = transform(index)
    advance_step
    transformed_index
  end

  def transform(index)
    forward_index = @rotors.reduce(index) do |previous_index, rotor|
      rotor.translate(previous_index)
    end

    reflected_index = reflector.at(forward_index)

    @rotors.reverse.reduce(reflected_index) do |previous_index, rotor|
      rotor.etalsnart(previous_index)
    end
  end

  def advance_step
    @rotors.reduce(true) do |step_signal, rotor|
      if step_signal
        rotor.advance!
      else
        false
      end
    end
  end

  def reflector
    ROTOR_UKWA
  end
end
