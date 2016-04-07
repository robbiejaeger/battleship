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

  def test_ship_has_no_coordinates_initially
    ship = Ship.new(3)
    assert_equal [], ship.coordinates
  end

  def test_can_tell_if_it_is_hit
    ship = Ship.new(2)
    ship.coordinates = [[0,0],[0,1]] # A1, B1

    assert ship.hit?([0,0])
  end

  def test_coordinates_hit_contains_hit
    ship = Ship.new(2)
    ship.coordinates = [[0,0],[0,1]]
    ship.hit?([0,0])

    assert_equal [[0,0]], ship.coordinates_hit
  end

  def test_ship_can_be_sunk_if_coordinates_match
    ship = Ship.new(2)
    ship.coordinates = [[0,0],[0,1]]
    ship.hit?([0,0])
    ship.hit?([0,1])

    assert ship.sunk?
  end

  def test_ship_is_not_sunk_if_coordinates_do_not_match
    ship = Ship.new(2)
    ship.coordinates = [[0,0],[0,1]]
    ship.hit?([0,0])
    ship.hit?([0,2])

    refute ship.sunk?
  end

end
