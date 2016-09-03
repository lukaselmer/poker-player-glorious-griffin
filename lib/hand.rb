# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
class Hand
  def initialize(json_hand)
    @hand = json_hand
  end

  def strength
    return 10 if royal_flush?
    return 9 if straight_flush?
    return 8 if four_of_a_kind?
    return 7 if full_house?
    return 6 if flush?
    return 5 if straight?
    return 4 if three_of_a_kind?
    return 3 if two_pair?
    return 2 if pair?
    return 1 if high_card?
    0
  end

  def win_probability(other_hand)
    my_strength = strength
    other_hand_strength = other_hand.strength

    return 1 if my_strength > other_hand_strength
    return 0 if my_strength < other_hand_strength
    0.5
  end

  def royal_flush?
    straight_flush? && includes_rank?('A')
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    ranks = @hand.map { |card| card['rank'] }
    counted_ranks = ranks.uniq.map { |i| [i, ranks.count(i)] }
    counted_ranks.count { |r| r.last == 4 } == 1
  end

  def full_house?
    ranks = @hand.map { |card| card['rank'] }
    counted_ranks = ranks.uniq.map { |i| [i, ranks.count(i)] }
    (counted_ranks.count { |r| r.last == 3 } == 1) && (counted_ranks.count { |r| r.last == 2 } == 1)
  end

  def straight?
    includes_ranks?('A K Q J 10') ||
      includes_ranks?('K Q J 10 9') ||
      includes_ranks?('J 10 9 8') ||
      includes_ranks?('10 9 8 7 6') ||
      includes_ranks?('9 8 7 6 5') ||
      includes_ranks?('8 7 6 5 4') ||
      includes_ranks?('7 6 5 4 3') ||
      includes_ranks?('6 5 4 3 2')
  end

  def includes_ranks?(ranks)
    ranks.split(' ').all? { |rank| includes_rank?(rank) }
  end

  def includes_rank?(rank)
    @hand.any? { |card| card['rank'] == rank }
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
