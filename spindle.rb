class Spindle
  def initialize(*rotors)
    @rotors = rotors
  end

  def call(index)
    transformed_index = transform(index)
    advance_step
    transformed_index
  end

  def transform(index)
    @rotors.reduce(index) do |previous_index, rotor|
      rotor.translate(previous_index)
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
end
