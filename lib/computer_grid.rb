require "./lib/grid"

class ComputerGrid < Grid

  attr_reader :grid, :name

  def initialize
    @name = "computer"
    @grid = gen_empty_grid
  end


  def place_ships_on_grid
    
  end

end
