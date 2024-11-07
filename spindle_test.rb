require "minitest/autorun"
require_relative "spindle"
require_relative "rotor"

class Spindle::Test < Minitest::Test
  def test_translates_according_to_rotors
    rotor_one = Rotor.new([1, 0, 2, 3])
    rotor_two = Rotor.new([1, 3, 0, 2])

    spindle = Spindle.new(rotor_one, rotor_two)
    assert_equal 3, spindle.call(0)
  end

  def test_second_rotor_steps_when_first_rotates_fully
    rotor_one = Rotor.new([1])

    mock_rotor = Minitest::Mock.new
    mock_rotor.expect :translate, 0, [1]
    mock_rotor.expect :advance!, true

    spindle = Spindle.new(rotor_one, mock_rotor)
    spindle.call(0)

    mock_rotor.verify
  end
end
