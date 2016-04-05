require "minitest/autorun"
require "minitest/pride"
require "./lib/timeofgame"

class TimeOfGameTest < Minitest::Test

  def test_time_can_exist
    gametime = TimeOfGame.new
    assert gametime
  end

  def test_can_set_start_time
    gametime = TimeOfGame.new
    time = Time.now

    start_time = gametime.set_start_time(time)

    assert_equal start_time.class, Time
  end

  def test_can_set_finish_time
    gametime = TimeOfGame.new
    time = Time.now

    finish_time = gametime.set_finish_time(time)

    assert_equal finish_time.class, Time
  end

  def test_can_get_total_time
    skip
    gametime = TimeOfGame.new
    gametime.set_start_time(Time.now)
    sleep(1)
    gametime.set_finish_time(Time.now)

    mins, secs = gametime.get_total_time

    assert_equal 0, mins
    assert_equal 1, secs
  end

end
