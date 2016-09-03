class Strategy
  def initialize(game_state)
    @game_state = game_state
  end

  def fold?
    true
  end

  def check?
    false
  end
end
