class Grid

  def gen_empty_grid
    Array.new(4, ".").map{|row| Array.new(4, ".")}
  end


  def grid_to_string(player, grid)
    if player == "player"
      title = "Your Ships"
    elsif player == "computer"
      title = "Computer"
    end
    row_label = ("A".."D").to_a
    column_label = ("1".."4").to_a

    to_print = "   #{title}\n"\
               "   #{row_label.join("  ")}\n"\
               "#{column_label[0]}  #{grid[0].join("  ")}\n"\
               "#{column_label[1]}  #{grid[1].join("  ")}\n"\
               "#{column_label[2]}  #{grid[2].join("  ")}\n"\
               "#{column_label[3]}  #{grid[3].join("  ")}\n"
  end

end