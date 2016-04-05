class GameTime

  def initialize
    @start = 0
    @finish = 0
  end

  def set_start_time(time)
    @start = time
  end

  def set_finish_time(time)
    @finish = time
  end

  def get_time_elapsed
    elapsed_seconds = @finish.to_i - @start.to_i
    mins, secs = elapsed_seconds.divmod(60)
  end

end
