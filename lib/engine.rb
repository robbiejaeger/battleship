require "./lib/game_time"
require "./lib/repl"
require "./lib/grid"
require "./lib/computer"
require "./lib/player"

class Engine

  def initialize
    @gametime = GameTime.new
    @player = Player.new
    @comp = Computer.new
  end

  def start_game_sequence
    quit = false
    until quit == true
      print Repl.opening_text
      answer = gets.chomp.downcase
      quit = decide_to_play_or_quit(answer)
    end
  end

  def decide_to_play_or_quit(answer)
    if answer == 'p' || answer == 'play'
      play
    elsif answer == 'i' || answer == 'instructions'
      puts Repl.load_instructions
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
    puts Repl.time_of_game(mins, secs)
    true
  end

  def shoot_at_each_other_until_winner
    game_over = false
    until game_over == true
      print Repl.get_players_shot(@player.guesses_grid.grid_to_string)

      game_over = player_shot_sequence
      if game_over == false
        game_over = computer_shot_sequence
      end

    end
  end

  def player_put_ships_on_grid
    puts @player.guesses_grid.grid_to_string
    puts Repl.place_ships_description
    print Repl.place_two_unit_ship
    @player.set_two_element_ship_on_grid(gets.chomp.upcase)
    print Repl.place_three_unit_ship
    @player.set_three_element_ship_on_grid(gets.chomp.upcase)

    puts Repl.begin_battle
  end

  # def shot_sequence(player)
  # end

  def player_shot_sequence
    guess_coordinate = @player.guess

    hit = @comp.ships_grid.two_ship.hit?(guess_coordinate)
    if hit
      @player.guesses_grid.mark_hit(guess_coordinate)
      @comp.ships_grid.mark_hit(guess_coordinate)
      puts Repl.player_hits_computer_ship
      if @comp.ships_grid.two_ship.sunk?
        puts Repl.player_sunk_computers_ship(2)
      end
    else
      hit = @comp.ships_grid.three_ship.hit?(guess_coordinate)
      if hit
        @player.guesses_grid.mark_hit(guess_coordinate)
        @comp.ships_grid.mark_hit(guess_coordinate)
        puts Repl.player_hits_computer_ship
        if @comp.ships_grid.three_ship.sunk?
          puts Repl.player_sunk_computers_ship(3)
        end
      else
        @player.guesses_grid.mark_miss(guess_coordinate)
        @comp.ships_grid.mark_miss(guess_coordinate)
        puts Repl.player_misses_computer_ship
      end
    end
    if @comp.ships_grid.two_ship.sunk? && @comp.ships_grid.three_ship.sunk?
      puts @player.guesses_grid.grid_to_string
      puts Repl.player_wins_game
      puts Repl.num_of_shots(@player.guesses.count)
      true
    else
      puts @player.guesses_grid.grid_to_string
      puts Repl.enter_to_contiue
      gets.chomp
      false
    end
  end

  def computer_shot_sequence
    guess_coordinate, grid_coordinate = @comp.gen_shot
    @comp.guesses << guess_coordinate
    grid_coordinate = @comp.convert_coordinate_to_grid(guess_coordinate)
    puts Repl.comp_shot_at(grid_coordinate)

    hit = @player.ships_grid.two_ship.hit?(guess_coordinate)
    if hit
      @comp.guesses_grid.mark_hit(guess_coordinate)
      @player.ships_grid.mark_hit(guess_coordinate)
      puts Repl.computer_hits_players_ship
      if @player.ships_grid.two_ship.sunk?
        puts Repl.computer_sunk_players_ship(2)
      end
    else
      hit = @player.ships_grid.three_ship.hit?(guess_coordinate)
      if hit
        @comp.guesses_grid.mark_hit(guess_coordinate)
        @player.ships_grid.mark_hit(guess_coordinate)
        puts Repl.computer_hits_players_ship
        if @player.ships_grid.three_ship.sunk?
          puts Repl.computer_sunk_players_ship(3)
        end
      else
        @comp.guesses_grid.mark_miss(guess_coordinate)
        @player.ships_grid.mark_miss(guess_coordinate)
        puts Repl.computer_misses_players_ship
      end
    end
    if @player.ships_grid.two_ship.sunk? && @player.ships_grid.three_ship.sunk?
      puts @player.ships_grid.grid_to_string
      puts Repl.computer_wins_game
      puts Repl.num_of_shots(@comp.guesses.count)
      true
    else
      puts @player.ships_grid.grid_to_string
      false
    end
  end

end
