require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"

class ShipTest < Minitest::Test

  def test_ship_can_exist
    ship = Ship.new
    assert ship
  end

end
