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
    puts @repl.time_of_game(mins, secs)
  end


  def shoot_at_each_other_until_winner
    game_over = false
    while game_over == false
      print @repl.get_players_shot(@player.guesses_grid.grid_to_string)

      game_over = player_shot_sequence
      if game_over == false
        game_over = computer_shot_sequence
      end
    end
  end


  def player_put_ships_on_grid
    puts @repl.place_ships_description
    print @repl.place_two_unit_ship
    @player.set_two_element_ship_on_grid(gets.chomp.upcase)
    print @repl.place_three_unit_ship
    @player.set_three_element_ship_on_grid(gets.chomp.upcase)

    puts @repl.begin_battle
  end


  def get_player_guess
    valid_guess = false
    while valid_guess == false
      guess = gets.chomp.upcase
      valid_guess = @player.test_guess(guess)
    end
    @player.convert_guess_input_to_coordinates(guess)
  end


  def player_shot_sequence
    guess_coordinate = get_player_guess
    @player.guesses << guess_coordinate

    hit = @comp.ships_grid.two_ship.hit?(guess_coordinate)
    if hit
      @player.guesses_grid.mark_hit(guess_coordinate)
      @comp.ships_grid.mark_hit(guess_coordinate)
      puts @repl.player_hits_computer_ship
      if @comp.ships_grid.two_ship.sunk?
        puts @repl.player_sunk_computers_ship(2)
      end
    else
      hit = @comp.ships_grid.three_ship.hit?(guess_coordinate)
      if hit
        @player.guesses_grid.mark_hit(guess_coordinate)
        @comp.ships_grid.mark_hit(guess_coordinate)
        puts @repl.player_hits_computer_ship
        if @comp.ships_grid.three_ship.sunk?
          puts @repl.player_sunk_computers_ship(3)
        end
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
    guess_coordinate, grid_coordinate = @comp.gen_shot
    @comp.guesses << guess_coordinate
    grid_coordinate = @comp.convert_coordinate_to_grid(guess_coordinate)
    puts @repl.comp_shot_at(grid_coordinate)

    hit = @player.ships_grid.two_ship.hit?(guess_coordinate)
    if hit
      @comp.guesses_grid.mark_hit(guess_coordinate)
      @player.ships_grid.mark_hit(guess_coordinate)
      puts @repl.computer_hits_players_ship
      if @player.ships_grid.two_ship.sunk?
        puts @repl.computer_sunk_players_ship(2)
      end
    else
      hit = @player.ships_grid.three_ship.hit?(guess_coordinate)
      if hit
        @comp.guesses_grid.mark_hit(guess_coordinate)
        @player.ships_grid.mark_hit(guess_coordinate)
        puts @repl.computer_hits_players_ship
        if @player.ships_grid.three_ship.sunk?
          puts @repl.computer_sunk_players_ship(3)
        end
      else
        @comp.guesses_grid.mark_miss(guess_coordinate)
        @player.ships_grid.mark_miss(guess_coordinate)
        puts @repl.computer_misses_players_ship
      end
    end
    if @player.ships_grid.two_ship.sunk? && @player.ships_grid.three_ship.sunk?
      puts @player.ships_grid.grid_to_string
      puts @repl.computer_wins_game
      true
    else
      puts @player.ships_grid.grid_to_string
      false
    end
  end

end
