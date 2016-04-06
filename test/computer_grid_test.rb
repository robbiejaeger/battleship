require "minitest/autorun"
require "minitest/pride"
require "./lib/computer_grid"

class ComputerGridTest < Minitest::Test

  def test_computer_grid_can_exist
    comp_grid = ComputerGrid.new
    assert comp_grid
  end

  def test_has_a_empty_grid_when_initialized
    comp_grid = ComputerGrid.new

    grid_array = Array.new(4, ".").map{|row| Array.new(4, ".")}

    assert_equal grid_array, comp_grid.grid
  end

  def test_can_place_two_unique_ships_on_grid
    comp_grid = ComputerGrid.new
    comp_grid.place_ships_on_grid

    result = (comp_grid.two_ship.coordinates & comp_grid.three_ship.coordinates).empty?

    assert result
  end

  def test_can_show_grid_with_ships
    comp_grid = ComputerGrid.new
    
  end

end