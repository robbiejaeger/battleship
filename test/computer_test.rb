require "minitest/autorun"
require "minitest/pride"
require "./lib/computer"

class ComputerTest < Minitest::Test

  def test_can_exist
    comp = Computer.new
    assert comp
  end

  def test_has_no_guesses_when_initialized
    comp = Computer.new
    assert_equal [], comp.guesses
  end

  def test_can_place_two_element_ship_on_grid

  end

  def test_can_place_two_unique_ships_on_grid
    comp = Computer.new
    comp.place_ships_on_grid

    assert (comp.ships_grid.two_ship.coordinates & comp.ships_grid.three_ship.coordinates).empty?
  end

  def test_can_show_grid_with_ships
    skip
    # Skipped because the output is random, no way to test string...
    comp_grid = ComputerGrid.new
    comp_grid.place_ships_on_grid
    comp_grid.put_ship_letters_on_grid

    comp_grid.grid_to_string(comp_grid.name,comp_grid.grid)
  end

end
