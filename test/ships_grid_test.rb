require "minitest/autorun"
require "minitest/pride"
require "./lib/ships_grid"

class ShipsGridTest < Minitest::Test

  def test_ships_grid_can_exist
    ships_grid = ShipsGrid.new
    assert ships_grid
  end

  def test_has_a_empty_grid_when_initialized
    ships_grid = ShipsGrid.new

    grid_array = Array.new(4, ".").map{|row| Array.new(4, ".")}

    assert_equal grid_array, ships_grid.grid
  end

end
