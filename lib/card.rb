class Card
  RANKS = {
    'A' => 13,
    'K' => 12,
    'Q' => 11,
    'J' => 10,
    '10' => 9,
    '9' => 8,
    '8' => 7,
    '7' => 6,
    '6' => 5,
    '5' => 4,
    '4' => 3,
    '3' => 2,
    '2' => 1
  }.freeze
  SUITS = {
    'clubs' => 4,
    'spades' => 3,
    'hearts' => 2,
    'diamonds' => 1
  }.freeze

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @rank_value = RANKS[@rank]
    @suit_value = SUITS[@suit]
  end
end
