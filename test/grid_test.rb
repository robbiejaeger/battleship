require "minitest/autorun"
require "minitest/pride"
require "./lib/grid"
require "./lib/player"

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
    player = Player.new
    string = "   1  2  3  4\n"\
             "A  .  .  .  .\n"\
             "B  .  .  .  .\n"\
             "C  .  .  .  .\n"\
             "D  .  .  .  .\n"


    grid_string = player.ships_grid.grid_to_string

    assert_equal string, grid_string
  end

  def test_can_mark_point_with_miss
    player = Player.new
    string = "   1  2  3  4\n"\
             "A  M  .  .  .\n"\
             "B  .  .  .  .\n"\
             "C  .  .  .  .\n"\
             "D  .  .  .  .\n"

    player.ships_grid.mark_miss([0,0])

    assert_equal string, player.ships_grid.grid_to_string
  end

  def test_can_mark_point_with_hit
    player = Player.new
    string = "   1  2  3  4\n"\
             "A  H  .  .  .\n"\
             "B  .  .  .  .\n"\
             "C  .  .  .  .\n"\
             "D  .  .  .  .\n"

    player.ships_grid.mark_hit([0,0])

    assert_equal string, player.ships_grid.grid_to_string
  end

end
