class Hand
  def initialize(raw_hand)
    @hand = raw_hand
  end

  def win_probability(_other_hand)
    0.5
  end
end
