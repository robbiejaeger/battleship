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
    array_of_strings = input.tr("1234","0123").tr("ABCD", "0123").split("")
    array_of_numbers = array_of_strings.reject { |e| e == " " }.map {|e| e.to_i}
    coordinates = array_of_numbers.each_slice(2).to_a
  end

  def set_two_element_ship_on_grid(input)
    @two_ship.coordinates = convert_player_input_to_coordinates(input)
  end

  def set_three_element_ship_on_grid(input)
    @three_ship.coordinates = convert_player_input_to_coordinates(input)
  end

  def put_ship_letters_on_grid
    @two_ship.coordinates.each do |coordinate|
      @grid[coordinate[0]][coordinate[1]] = "2"
    end
    @three_ship.coordinates.each do |coordinate|
      @grid[coordinate[0]][coordinate[1]] = "3"
    end
  end

end
