require "./lib/grid"

class ComputerGrid < Grid

  attr_reader :grid, :name

  def initialize
    @name = "computer"
    @grid = gen_empty_grid
  end

end
