require "./lib/grid"

class PlayerGrid < Grid

  attr_reader :grid

  def initialize
    @grid = gen_empty_grid
  end

end
