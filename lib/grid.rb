class Grid

  def gen_empty_grid
    Array.new(4, ".").map{|row| Array.new(4, ".")}
  end


  def grid_to_string
    row_label = ("A".."D").to_a
    column_label = ("1".."4").to_a

    to_print = "   #{column_label.join("  ")}\n"\
               "#{row_label[0]}  #{@grid[0].join("  ")}\n"\
               "#{row_label[1]}  #{@grid[1].join("  ")}\n"\
               "#{row_label[2]}  #{@grid[2].join("  ")}\n"\
               "#{row_label[3]}  #{@grid[3].join("  ")}\n"

  end

end
