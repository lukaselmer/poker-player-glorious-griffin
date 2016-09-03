require_relative '../strategy'
require_relative 'win_probability_calculator'

class WinProbabilityStrategy < Strategy
  def initialize(game_state)
    super(game_state)
    calc = WinProbabilityCalculator.new
    @win_probability = calc.calculate_win_probability(game_state.my_cards,
                                                      game_state.community_cards)
  end

  def fold?
    @win_probability < 0.3
  end

  def call?
    @win_probability < 0.7
  end

  def wished_value_to_raise
    return minimum_raise * 2 if @win_probability >= 0.9
    return minimum_raise * 1.5 if @win_probability >= 0.8
    minimum_raise
  end
end
