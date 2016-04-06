require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"

class ShipTest < Minitest::Test

  def test_ship_can_exist
    ship = Ship.new(2)
    assert ship
  end

  def test_new_ship_can_have_two_elements
    ship = Ship.new(2)

    assert_equal 2, ship.num_elements
  end

end
