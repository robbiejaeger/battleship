require "minitest/autorun"
require "minitest/pride"
require "./lib/guesses_grid"

class GuessesGridTest < Minitest::Test

  def test_can_exist
    guesses_grid = GuessesGrid.new
    assert guesses_grid
  end

  def test_grid_is_empty_when_initialized
    guesses_grid = GuessesGrid.new

    grid_array = Array.new(4, ".").map{|row| Array.new(4, ".")}

    assert_equal grid_array, guesses_grid.grid
  end

end
