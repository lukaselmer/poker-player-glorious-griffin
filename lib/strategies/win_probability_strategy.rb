require_relative '../strategy'
require_relative 'win_probability_calculator'

class WinProbabilityStrategy < Strategy
  def initialize(game_state)
    super(game_state)
    calc = WinProbabilityCalculator.new
    @win_probability = calc.calculate_win_probability(
      game_state.my_cards,
      game_state.community_cards,
      game_state.number_of_active_players
    )
  end

  def fold?
    @win_probability < 0.3
  end

  def call?
    @win_probability < 0.7
  end

  def minimum_raise
    @game_state.minimum_raise || 1
  end

  def wished_value_to_raise
    return minimum_raise * 2 if @win_probability >= 0.9
    return (minimum_raise * 1.5).to_i if @win_probability >= 0.8
    minimum_raise
  end
end
