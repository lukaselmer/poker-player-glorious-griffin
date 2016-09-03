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
end
