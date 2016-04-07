require "./lib/ships_grid"
require "./lib/guesses_grid"

class Computer

  attr_reader :name
  attr_accessor :guesses, :ships_grid, :guesses_grid

  def initialize
    @name = "computer"
    @ships_grid = ShipsGrid.new
    @guesses_grid = GuessesGrid.new
    @guesses = []
  end

  def place_ships_on_grid
    place_two_element_ship_on_grid
    unique = false
      until unique == true
        place_three_element_ship_on_grid
        if (@ships_grid.two_ship.coordinates & @ships_grid.three_ship.coordinates).empty?
          unique = true
        else
          unique = false
        end
      end
      @ships_grid.put_ship_letters_on_grid
  end

  def place_two_element_ship_on_grid
    num = rand(2)
    if num == 0
      @ships_grid.two_ship.gen_vertical_ship
    elsif num == 1
      @ships_grid.two_ship.gen_horizontal_ship
    end
  end

  def place_three_element_ship_on_grid
    num = rand(2)
    if num == 0
      @ships_grid.three_ship.gen_vertical_ship
    elsif num == 1
      @ships_grid.three_ship.gen_horizontal_ship
    end
  end

  def gen_shot
    unique = false
    while unique == false
      coordinate = [rand(4),rand(4)]
      unique = true if ([coordinate] & @guesses).empty?
    end
    coordinate
  end

end
