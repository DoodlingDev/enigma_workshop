require "minitest/autorun"
require_relative "rotor"

class Rotor::Test < Minitest::Test
  def test_translates_integer_based_on_wiring
    rotor = Rotor.new([1, 2, 0])
    assert_equal 1, rotor.translate(0)
    assert_equal 2, rotor.translate(1)
    assert_equal 0, rotor.translate(2)
  end
end
