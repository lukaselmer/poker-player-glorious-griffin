# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
class Hand
  def initialize(hand)
    @hand = hand
  end

  def win_probability(_other_hand)
    return 1 if royal_flush?
    return 1 if straight_flush?
    return 1 if four_of_a_kind?
    return 1 if full_house?
    return 1 if flush?
    return 1 if straight?
    return 1 if three_of_a_kind?
    return 1 if two_pair?
    return 1 if pair?
    return 1 if high_card?
    0.5
  end

  def royal_flush?
    # code here
  end

  def straight_flush?
    # code here
  end

  def four_of_a_kind?
    ranks = @hand.map { |card| card['rank'] }
    counted_ranks = ranks.uniq.map { |i| [i, ranks.count(i)] }
    counted_ranks.count { |r| r.last == 4 } == 1
  end

  def full_house?
    # code here
  end

  def straight?
    # code here
  end

  def three_of_a_kind?
    ranks = @hand.map { |card| card['rank'] }
    counted_ranks = ranks.uniq.map { |i| [i, ranks.count(i)] }
    counted_ranks.count { |r| r.last == 3 } == 1
  end

  def two_pair?
    ranks = @hand.map { |card| card['rank'] }
    counted_ranks = ranks.uniq.map { |i| [i, ranks.count(i)] }
    counted_ranks.count { |r| r.last == 2 } == 2
  end

  def high_card?
    # code here
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
