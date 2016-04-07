require "./lib/grid"

class GuessesGrid < Grid

  attr_accessor :grid

  def initialize
    @grid = gen_empty_grid
  end

end
