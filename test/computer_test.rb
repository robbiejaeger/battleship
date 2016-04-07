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

  def test_can_place_two_unique_ships_on_grid
    comp = Computer.new
    comp.place_ships_on_grid

    assert (comp.ships_grid.two_ship.coordinates & comp.ships_grid.three_ship.coordinates).empty?
  end

  def test_can_show_grid_with_ships
    skip
    # Skipped because the output is random, no way to test string...
    comp = Computer.new
    comp.place_ships_on_grid

    print "\n"
    puts comp.ships_grid.grid_to_string
  end

  def test_can_gen_unique_shot
    comp = Computer.new
    comp.guesses = [[0,0],[0,1],[0,2]]

    coordinate = comp.gen_shot

    assert (comp.guesses & coordinate).empty?
  end

  def test_can_convert_coordinate_to_grid
    comp = Computer.new
    coordinate = [1,1]
    grid = "B2"

    result = comp.convert_coordinate_to_grid(coordinate)

    assert_equal grid, result
  end

end
