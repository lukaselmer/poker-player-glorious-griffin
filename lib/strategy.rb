class Strategy
  def initialize(game_state)
    @game_state = game_state
  end

  def fold?
    true
  end

  def call?
    @game_state.cards('Glorious Griffin').any { |card| card['rank'] == 'A' }
  end

  def value_to_raise
    1
  end
end
