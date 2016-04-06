require "minitest/autorun"
require "minitest/pride"
require "./lib/guesses_grid"

class GuessesGridTest < Minitest::Test

  def test_can_exist
    guesses_grid = GuessesGrid.new
    assert guesses_grid
  end

end
