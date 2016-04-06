require "./lib/grid"
require "./lib/ship"

class PlayerGrid < Grid

  attr_reader :grid, :name

  def initialize
    @name = "player"
    @grid = gen_empty_grid
    @two_ship = Ship.new(2)
    @three_ship = Ship.new(3)
  end

  def convert_player_input_to_coordinates(input)
    array_of_strings = input.tr("ABCD", "0123").split("")
    array_of_numbers = array_of_strings.reject { |e| e == " " }.map {|e| e.to_i}
    coordinates = array_of_numbers.each_slice(2).to_a
  end

  def set_two_element_ship_on_grid(input)
    
  end

  def set_three_element_ship_on_grid(input)
  end

end
