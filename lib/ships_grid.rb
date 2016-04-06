require "./lib/grid"
require "./lib/ship"

class ShipsGrid < Grid

  attr_accessor :two_ship, :three_ship, :grid

  def initialize
    @two_ship = Ship.new(2)
    @three_ship = Ship.new(3)
    @grid = gen_empty_grid
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
