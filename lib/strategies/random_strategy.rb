require_relative '../strategy'

class RandomStrategy < Strategy
  def initialize(game_state)
    super(game_state)
    @strategy = [:fold, :check, :raise].sample
  end

  def fold?
    @strategy == :fold
  end

  def check?
    @strategy == :check
  end
end
