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
    correct_coordinates = [[1,0],[1,1],[1,2]]

    coordinates = player_grid.convert_player_input_to_coordinates(input)

    assert_equal correct_coordinates, coordinates
  end

  def test_can_put_ships_on_grid_from_input_with_uneven_input_spacing
    player_grid = PlayerGrid.new
    input1 = "B1   B2  B3"
    input2 = "C4 D4  "
    string = "   Your Ships\n"\
             "   1  2  3  4\n"\
             "A  .  .  .  .\n"\
             "B  3  3  3  .\n"\
             "C  .  .  .  2\n"\
             "D  .  .  .  2\n"

    player_grid.set_two_element_ship_on_grid(input2)
    player_grid.set_three_element_ship_on_grid(input1)
    player_grid.put_ship_letters_on_grid
    output = player_grid.grid_to_string(player_grid.name, player_grid.grid)

    assert_equal string, output
  end

end
