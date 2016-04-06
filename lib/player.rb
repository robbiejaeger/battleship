require "./lib/ships_grid"
require "./lib/guesses_grid"

class Player

  attr_reader :name
  attr_accessor :guesses, :ships_grid, :guesses_grid

  def initialize
    @name = "player"
    @ships_grid = ShipsGrid.new
    @guesses_grid = GuessesGrid.new
    @guesses = []
  end

  def convert_player_input_to_coordinates(input)
    array_of_strings = input.tr("1234","0123").tr("ABCD", "0123").split("")
    array_of_numbers = array_of_strings.reject { |e| e == " " }.map {|e| e.to_i}
    coordinates = array_of_numbers.each_slice(2).to_a
  end

  def set_two_element_ship_on_grid(input)
    @ships_grid.two_ship.coordinates = convert_player_input_to_coordinates(input)
  end

  def set_three_element_ship_on_grid(input)
    @ships_grid.three_ship.coordinates = convert_player_input_to_coordinates(input)
    @ships_grid.put_ship_letters_on_grid
  end

end
