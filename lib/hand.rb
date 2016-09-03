class Hand
  def initialize(hand)
    @hand = hand
  end

  def win_probability(_other_hand)
    return 1 if flush?
    0.5
  end

  def dummy
    # op there is L
    # below here is J
  end

  def flush?
    @hand.map { |card| card['suit'] }.uniq.size == 1
  end

  def pair?
    ranks = @hand.map { |card| card['rank'] }
    ranks.uniq.size == (@hand.size - 1)
  end
end
