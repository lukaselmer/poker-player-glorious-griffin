class RandomStrategy < Strategy
  def initialize(game_state)
    super(game_state)
    @strategy = [:fold, :call, :raise].sample
  end

  def fold?
    @strategy == :fold
  end

  def call?
    @strategy == :call
  end
end
