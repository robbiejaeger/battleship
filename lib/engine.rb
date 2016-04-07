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

    @comp.place_ships_on_grid
    player_put_ships_on_grid

    shoot_at_each_other_until_winner

    @gametime.set_finish_time(Time.now)
    mins, secs = @gametime.get_time_elapsed
    true
  end


  def shoot_at_each_other_until_winner
    game_over = false
    while game_over == false
      print @repl.get_players_shot(@player.guesses_grid.grid_to_string)

      game_over = player_shot_sequence
      game_over = computer_shot_sequence
    end
  end


  def player_put_ships_on_grid
    puts @repl.place_ships_description
    print @repl.place_two_unit_ship
    @player.set_two_element_ship_on_grid(gets.chomp)
    print @repl.place_three_unit_ship
    @player.set_three_element_ship_on_grid(gets.chomp)
  end


  def get_player_guess
    valid_guess = false
    while valid_guess == false
      guess = gets.chomp
      valid_guess = @player.test_guess(guess)
    end
    @player.convert_guess_input_to_coordinates(guess)
  end


  def player_shot_sequence
    guess_coordinate = get_player_guess
    @player.guesses << guess_coordinate
    hit = @comp.ships_grid.two_ship.hit?(guess_coordinate)
    # test is player has hit computer's ship
    if hit
      @player.guesses_grid.mark_hit(guess_coordinate)
      @comp.ships_grid.mark_hit(guess_coordinate)
      puts @repl.player_hits_computer_ship
    else
      hit = @comp.ships_grid.three_ship.hit?(guess_coordinate)
      if hit
        @player.guesses_grid.mark_hit(guess_coordinate)
        @comp.ships_grid.mark_hit(guess_coordinate)
        puts @repl.player_hits_computer_ship
      else
        @player.guesses_grid.mark_miss(guess_coordinate)
        @comp.ships_grid.mark_miss(guess_coordinate)
        puts @repl.player_misses_computer_ship
      end
    end
    if @comp.ships_grid.two_ship.sunk? && @comp.ships_grid.three_ship.sunk?
      puts @player.guesses_grid.grid_to_string
      puts @repl.player_wins_game
      true
    else
      puts @player.guesses_grid.grid_to_string
      puts @repl.enter_to_contiue
      gets.chomp
      false
    end
  end

  def computer_shot_sequence
  end

end
