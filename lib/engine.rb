require "./lib/game_time"
require "./lib/repl"

class Engine

  def initialize
    @repl = Repl.new
  end

  def start_game_sequence
    quit = false

    while quit == false
      print @repl.opening_text
      answer = gets.chomp.downcase

      if answer == 'p' || answer == 'play'
        quit = play
      elsif answer == 'i' || answer == 'instructions'
        puts @repl.load_instructions
      elsif answer == 'q' || answer == 'quit'
        quit = true
      end
    end
  end

  def play
    game_over = false
    gametime = GameTime.new
    gametime.set_start_time(Time.now)

    place_ships_on_grid

    while game_over == false
      true
    end

    gametime.set_finish_time(Time.now)
    mins, secs = gametime.get_time_elapsed
    true
  end

# private

  def place_ships_on_grid
    puts @repl.place_ships_description
  end


end
