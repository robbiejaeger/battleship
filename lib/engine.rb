require "./lib/game_time"
require "./lib/repl"
require "./lib/grid"
require "./lib/computer"
require "./lib/player"

class Engine

  def initialize
    @repl = Repl.new
    @gametime = GameTime.new
    @player = Player.new
    @comp = Computer.new
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
    @gametime.set_start_time(Time.now)

    comp_gen_ships_on_grid
    player_put_ships_on_grid

    shoot_at_each_other_until_winner

    @gametime.set_finish_time(Time.now)
    mins, secs = @gametime.get_time_elapsed
    true
  end


  def shoot_at_each_other_until_winner
    game_over = false
    while game_over == false
      game_over = true
    end
  end


  def comp_gen_ships_on_grid
    @comp.place_ships_on_grid
  end


  def player_put_ships_on_grid
    puts @repl.place_ships_description
    print @repl.place_two_unit_ship
    @player.set_two_element_ship_on_grid(gets.chomp)
    print @repl.place_three_unit_ship
    @player.set_three_element_ship_on_grid(gets.chomp)
  end

end
