class Repl

  def self.opening_text
    "\nWelcome to \033[31mBATTLESHIP\033[0m\n"\
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n"\
    "> "
  end

  def self.load_instructions
    instructions_file = File.open("./lib/instructions.txt", "r")
    contents = instructions_file.read
  end

  def self.place_ships_description
    "\nI have laid out my ships on the grid. You now need to layout your two ships.\n"\
    "The first is two units long and the second is three units long.\n"\
    "The grid has A1 at the top left and D4 at the bottom right.\n\n"\
  end

  def self.place_two_unit_ship
    "Enter the coordinates for the two-unit ship: "
  end

  def self.place_three_unit_ship
    "Enter the coordinates for the three-unit ship: "
  end

  def self.get_players_shot(player_guess_grid)
    "Your hit and miss history:\n"\
    "#{player_guess_grid}\n"\
    "Where do you want to shoot? "
  end

  def self.player_hits_computer_ship
    "HIT!"
  end

  def self.player_misses_computer_ship
    "MISS!"
  end

  def self.computer_hits_players_ship
    "You've been hit!"
  end

  def self.computer_misses_players_ship
    "A lucky miss!"
  end

  def self.player_sunk_computers_ship(num)
    "Yes! You've sunk a ship of size #{num}!"
  end

  def self.computer_sunk_players_ship(num)
    "Oh no! Your ship of size #{num} has been sunk!"
  end

  def self.player_wins_game
    "Congratulations! You've sunk all of your opponent's ships!"
  end

  def self.computer_wins_game
    "Sorry, you've lost! All of your ships have been sunk!"
  end

  def self.enter_to_contiue
    "Press ENTER to continue."
  end

  def self.comp_shot_at(location)
    "The computer shot at location #{location}."
  end

  def self.begin_battle
    "\nGrab your lifejacket! Let the battle begin!\n\n"
  end

  def self.guess_to_long_or_short
    "Guess must be two characters. Guess again: "
  end

  def self.time_of_game(mins, secs)
    "The total time of the game was #{mins} minutes and #{secs} seconds."
  end

  def self.num_of_shots(num)
    "It took #{num} shots to sink all of the ships."
  end


end
