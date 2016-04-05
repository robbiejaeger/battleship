require "./lib/game_time"

class Engine

  def play
    gametime = GameTime.new
    gametime.set_start_time(Time.now)

    puts "Playing game!"

    gametime.set_finish_time(Time.now)
    mins, secs = gametime.get_time_elapsed

    puts "Minutes: #{mins} and seconds: #{secs}."
    true
  end

end
