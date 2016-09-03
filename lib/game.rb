require_relative 'strategies/win_probability_strategy'
require_relative 'strategies/random_strategy'

class Game
  attr_accessor :game_state

  def initialize
    @strategy_class = WinProbabilityStrategy
  end

  def strategy
    @strategy_class.new(game_state)
  end
end
