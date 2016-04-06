require "./lib/game_time"
require "./lib/repl"
require "./lib/grid"
require "./lib/computer_grid"
require "./lib/player_grid"

class Engine

  def initialize
    @repl = Repl.new
    @gametime = GameTime.new
    @player_grid = PlayerGrid.new
    @comp_grid = ComputerGrid.new
  end


  def start_game_sequence
    quit = false
    while quit == false
      print @repl.opening_text
      answer = gets.chomp.downcase
      quit = decide_to_play_or_quit(answer)
    end
  end


  def decide_to_play_or_quit(answer)
    if answer == 'p' || answer == 'play'
      play
    elsif answer == 'i' || answer == 'instructions'
      puts @repl.load_instructions
      false
    elsif answer == 'q' || answer == 'quit'
      true
    end
  end


  def play
    game_over = false
    @gametime.set_start_time(Time.now)

    comp_gen_ships_on_grid
    player_put_ships_on_grid

    continue_playing_until_winner(game_over)

    @gametime.set_finish_time(Time.now)
    mins, secs = @gametime.get_time_elapsed
    true
  end


  def continue_playing_until_winner(game_over)
    while game_over == false
      game_over = true
    end
  end


  def comp_gen_ships_on_grid
    @comp_grid.place_ships_on_grid
  end


  def player_put_ships_on_grid
    puts @repl.place_ships_description
    print @repl.place_two_unit_ship
    @player_grid.set_two_element_ship_on_grid(gets.chomp)
    print @repl.place_three_unti_ship
    @player_grid.set_three_element_ship_on_grid(gets.chomp)
  end

end
