require "./lib/ships_grid"
require "./lib/guesses_grid"


class Player

  NAME = "player"

  attr_reader :name
  attr_accessor :guesses, :ships_grid, :guesses_grid

  def initialize
    @ships_grid = ShipsGrid.new
    @guesses_grid = GuessesGrid.new
    @guesses = []
  end

  def convert_ship_input_to_coordinates(input)
    array_of_strings = input.tr("1234","0123").tr("ABCD", "0123").split("")
    array_of_numbers = array_of_strings.reject { |e| e == " " }.map {|e| e.to_i}
    coordinates = array_of_numbers.each_slice(2).to_a.map {|a| a.reverse}
  end

  def set_two_element_ship_on_grid(input)
    @ships_grid.two_ship.coordinates = convert_ship_input_to_coordinates(input)
  end

  def set_three_element_ship_on_grid(input)
    @ships_grid.three_ship.coordinates = convert_ship_input_to_coordinates(input)
    @ships_grid.put_ship_letters_on_grid
  end

  def guess
    valid_guess = false
    while valid_guess == false
      guess = gets.chomp.upcase
      valid_guess = test_guess(guess)
    end
    convert_guess_input_to_coordinates(guess)
  end

  def test_guess(input)
    if input.length <= 1 || input.length > 2
      print "Shot must be two characters. Guess again: "
      return false
    end
    guess_coordinate = convert_guess_input_to_coordinates(input)
    if ([guess_coordinate] & @guesses).empty?
      @guesses << guess_coordinate
      true
    else
      print "You already shot there. Pick another spot: "
      false
    end
  end

  def convert_guess_input_to_coordinates(input)
    array_of_strings = input.tr("1234","0123").tr("ABCD", "0123").split("")
    coordinates = array_of_strings.reject { |e| e == " " }.map {|e| e.to_i}.reverse
  end

end
