require "./lib/grid"

class Ship

  attr_reader :num_elements
  attr_accessor :coordinates

  def initialize(num_elements)
    @grid = Grid.new
    @num_elements = num_elements
  end


  def gen_vertical_ship
    start_point = (0..(4 - @num_elements)).to_a.sample
    end_point = start_point + (@num_elements - 1)
    columns = [(0..3).to_a.sample]*@num_elements
    rows = (start_point..end_point).to_a

    @coordinates = columns.zip(rows)
  end


  def gen_horizontal_ship
    start_point = (0..(4 - @num_elements)).to_a.sample
    end_point = start_point + (@num_elements - 1)
    rows = [(0..3).to_a.sample]*@num_elements
    columns = (start_point..end_point).to_a

    @coordinates = columns.zip(rows)
  end

end
