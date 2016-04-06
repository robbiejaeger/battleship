require "./lib/grid"
require "./lib/ship"

class ComputerGrid < Grid

  attr_reader :grid, :name, :two_ship, :three_ship

  def initialize
    @name = "computer"
    @grid = gen_empty_grid
    @two_ship = Ship.new(2)
    @three_ship = Ship.new(3)
  end


  def place_ships_on_grid
    place_two_element_ship_on_grid
    unique = false
      until unique == true
        place_three_element_ship_on_grid
        if (@two_ship.coordinates & @three_ship.coordinates).empty?
          unique = true
        else
          unique = false
        end
      end
  end

  def place_two_element_ship_on_grid
    num = rand(2)
    if num == 0
      @two_ship.gen_vertical_ship
    elsif num == 1
      @two_ship.gen_horizontal_ship
    end
  end

  def place_three_element_ship_on_grid
    num = rand(2)
    if num == 0
      @three_ship.gen_vertical_ship
    elsif num == 1
      @three_ship.gen_horizontal_ship
    end
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
