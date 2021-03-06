require "minitest/autorun"
require "minitest/pride"
require "./lib/player"

class PlayerTest < Minitest::Test

  def test_can_exist
    player = Player.new
    assert player
  end

  def test_has_no_guesses_when_initialized
    player = Player.new
    assert_equal [], player.guesses
  end

  def test_can_convert_input_to_coordinates
    player = Player.new
    input = "B1 B2 B3"
    correct_coordinates = [[0,1],[1,1],[2,1]]

    coordinates = player.convert_ship_input_to_coordinates(input)

    assert_equal correct_coordinates, coordinates
  end

  def test_can_put_ships_on_grid_from_input_with_uneven_input_spacing
    player = Player.new
    input1 = "C4 D4  "
    input2 = "B1   B2  B3"
    string = "   A  B  C  D\n"\
             "1  .  3  .  .\n"\
             "2  .  3  .  .\n"\
             "3  .  3  .  .\n"\
             "4  .  .  2  2\n"


    player.set_two_element_ship_on_grid(input1)
    player.set_three_element_ship_on_grid(input2)
    player.ships_grid.put_ship_letters_on_grid
    output = player.ships_grid.grid_to_string

    assert_equal string, output
  end

  def test_player_can_have_a_guess
    player = Player.new
    guess = [[0,0]]

    player.guess("A1")

    assert_equal guess, player.guesses
  end

  def test_player_can_have_multiple_guesses
    player = Player.new
    guess = [[0,0],[0,1],[0,2]]

    player.guess("A1")
    player.guess("B1")
    player.guess("C1")

    assert_equal guess, player.guesses
  end

  def test_cannot_have_duplicate_guesses
    skip
    player = Player.new
    guess = [[0,0]]

    player.test_guess("A1")
    player.test_guess("A1")

    assert_equal guess, player.guesses
  end

  def test_cannot_guess_too_long
    skip
    player = Player.new

    result = player.test_guess("AAAAA")

    refute result
  end

end
