class Strategy
  def initialize(game_state)
    @game_state = game_state
  end

  def fold?
    true
  end

  def call?
    false
  end

  def value_to_raise
    1
  end
end
