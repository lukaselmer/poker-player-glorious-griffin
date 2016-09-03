class Strategy
  def initialize(game_state)
    @game_state = game_state
  end

  def fold?
    true
  end

  def check?
    @game_state.cards('Glorious Griffin').any { |card| card['rank'] == 'A' }
  end
end
