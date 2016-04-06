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

  def test_can_generate_a_vertical_ship
    skip
    ship = Ship.new(3)
    # columns = [(0..3).to_a.sample]*length_of_ship
    # rows = (start_point..end_point).to_a
    # possible_coordinates = rows.zip(columns)

    coordinates = ship.gen_vertical_ship

    # assert_equal
  end

  def test_can_generate_a_horizontal_ship
    skip
    ship = Ship.new(3)

    coordinates = ship.gen_horizontal_ship.inspect
  end

end
