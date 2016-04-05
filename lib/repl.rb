class Repl

  def opening_text
    "\nWelcome to BATTLESHIP\n"\
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n"\
    "> "
  end

  def load_instructions
    instructions_file = File.open("./lib/instructions.txt", "r")
    contents = instructions_file.read
  end

  def place_ships
    
  end

end
