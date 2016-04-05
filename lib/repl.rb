class Repl

  def opening_text
    "\nWelcome to \033[31mBATTLESHIP\033[0m\n"\
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n"\
    "> "
  end

  def load_instructions
    instructions_file = File.open("./lib/instructions.txt", "r")
    contents = instructions_file.read
  end

  def place_ships_description
    "I have laid out my ships on the grid. You now need to layout your two ships.\n"\
    "The first is two units long and the second is three units long.\n"\
    "The grid has A1 at the top left and D4 at the bottom right."\
  end

  def place_two_unit_ship
    "Enter the squares for the two-unit ship:"
  end

  def place_three_unti_ship
    "Enter the squares for the three-unit ship:"
  end

end
