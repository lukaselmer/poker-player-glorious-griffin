class Hand
  def initialize(hand)
    @hand = hand
  end

  def win_probability(_other_hand)
    return 1 if flush?
    0.5
  end

  def flush?
    p @hand
    p @hand.map { |card| card['suit']}
    @hand.map { |card| card['suit']}.uniq.size == 1
  end
end
