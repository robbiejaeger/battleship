require "minitest/autorun"
require "minitest/pride"
require "./lib/engine"

class EngineTest < Minitest::Test

  def test_engine_can_exist
    engine = Engine.new
    assert engine
  end

  def test_can_decide_to_quit
    engine = Engine.new

    result = engine.decide_to_play_or_quit("q")

    assert result
  end

end
