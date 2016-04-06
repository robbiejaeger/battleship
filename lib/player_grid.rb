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

end
