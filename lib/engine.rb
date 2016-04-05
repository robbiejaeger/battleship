require "./lib/timeofgame"

class Engine

  def play
    gametime = TimeOfGame.new
    gametime.set_start_time(Time.now)

    puts "Playing game!"

    gametime.set_finish_time(Time.now)
    mins, secs = gametime.get_total_time

    puts "Minutes: #{mins} and seconds: #{secs}."
    true
  end

end
