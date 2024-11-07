require "minitest/autorun"
require_relative "rotor"

class Rotor::Test < Minitest::Test
  def test_translates_integer_based_on_wiring
    rotor = Rotor.new([1, 2, 0])
    assert_equal 1, rotor.translate(0)

    rotor = Rotor.new([1, 2, 0])
    assert_equal 2, rotor.translate(1)

    rotor = Rotor.new([1, 2, 0])
    assert_equal 0, rotor.translate(2)
  end

  def test_advance_moves_the_key_for_next_translation
    rotor = Rotor.new([1, 2, 3, 0])
    assert_equal 1, rotor.translate(0)
    rotor.advance!

    assert_equal 2, rotor.translate(0)
  end

  def test_advance_in_a_full_circle_goes_to_zero
    rotor = Rotor.new([1, 2, 3, 0])
    assert_equal 1, rotor.translate(0)
    rotor.advance!

    assert_equal 2, rotor.translate(0)
    rotor.advance!

    assert_equal 3, rotor.translate(0)
    rotor.advance!

    assert_equal 0, rotor.translate(0)
    rotor.advance!

    assert_equal 1, rotor.translate(0)
  end

  def test_advance_returns_true_after_full_circle
    rotor = Rotor.new([1, 0])
    rotor.advance!
    result = rotor.advance!

    assert_equal true, result
  end

  def test_advance_returns_false_when_it_isnt_a_full_circle
    rotor = Rotor.new([1, 2, 3, 4, 0])

    result = rotor.advance!
    assert_equal false, result

    result = rotor.advance!
    assert_equal false, result
  end
end

