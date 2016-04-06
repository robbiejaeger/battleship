require "minitest/autorun"
require "minitest/pride"
require "./lib/player_grid"

class PlayerGridTest < Minitest::Test

  def test_player_grid_can_exist
    player_grid = PlayerGrid.new
    assert player_grid
  end

  def test_has_a_empty_grid_when_initialized
    player_grid = PlayerGrid.new

    grid_array = Array.new(4, ".").map{|row| Array.new(4, ".")}

    assert_equal grid_array, player_grid.grid
  end

  def test_can_convert_input_to_coordinates
    player_grid = PlayerGrid.new
    input = "B1 B2 B3"
    correct_coordinates = [[1,1],[1,2],[1,3]]

    coordinates = player_grid.convert_player_input_to_coordinates(input)

    assert_equal correct_coordinates, coordinates
  end

end
