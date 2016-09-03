class Hand
  def initialize(hand)
    @hand = hand
  end

  def win_probability(_other_hand)
    return 1 if flush?
    0.5
  end

  def flush?
    suit = @hand.first['suit']
    @hand.all? { |card| card['suit'] == suit }
  end
end
