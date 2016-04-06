require "./lib/grid"

class GuessesGrid < Grid

  def initialize
    @grid = gen_empty_grid
    @hits = []
    @misses = []
  end

end
