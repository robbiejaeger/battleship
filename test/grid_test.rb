require "minitest/autorun"
require "minitest/pride"
require "./lib/grid"
require "./lib/player_grid"

class GridTest < Minitest::Test

  def test_grid_class_exists
    grid = Grid.new
    assert grid
  end

  def test_can_gen_an_empty_grid
    grid = Grid.new
    array = Array.new(4, ".").map{|row| Array.new(4, ".")}

    grid_array = grid.gen_empty_grid

    assert_equal array, grid_array
  end

  def test_can_convert_grid_to_string
    player_grid = PlayerGrid.new
    string = "   Your Ships\n"\
             "   1  2  3  4\n"\
             "A  .  .  .  .\n"\
             "B  .  .  .  .\n"\
             "C  .  .  .  .\n"\
             "D  .  .  .  .\n"

    grid_string = player_grid.grid_to_string(player_grid.name, player_grid.grid)

    assert_equal string, grid_string
  end

end
