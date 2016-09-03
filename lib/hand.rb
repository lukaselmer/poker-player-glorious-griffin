# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/AbcSize
class Hand
  def initialize(json_hand)
    @hand = json_hand
    @ranks = @hand.map { |card| card['rank'] }
    @suites = @hand.map { |card| card['suit'] }
    @cache = {}
  end

  def strength
    @cache[:strength] ||= base_strength + high_card_value
  end

  def base_strength
    @cache[:base_strength] ||= calc_base_strength
  end

  def calc_base_strength
    return 10 if royal_flush?
    return 9 if straight_flush?
    return 8 if four_of_a_kind?
    return 7 if full_house?
    return 6 if flush?
    return 5 if straight?
    return 4 if three_of_a_kind?
    return 3 if two_pair?
    return 2 if pair?
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
    counted_ranks = @ranks.uniq.map { |i| [i, @ranks.count(i)] }
    @cache[:four_of_a_kind] ||= counted_ranks.count { |r| r.last == 4 } == 1
  end

  def full_house?
    counted_ranks = @ranks.uniq.map { |i| [i, @ranks.count(i)] }
    full_house = (counted_ranks.count { |r| r.last == 3 } == 1) && (counted_ranks.count { |r| r.last == 2 } == 1)
    @cache[:full_house] ||= full_house
  end

  def straight?
    @cache[:straight] ||= includes_ranks?('A K Q J 10') ||
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
    @cache["includes_rank_#{rank}"] ||= @hand.any? { |card| card['rank'] == rank }
  end

  def three_of_a_kind?
    counted_ranks = @ranks.uniq.map { |i| [i, @ranks.count(i)] }
    @cache[:three_of_a_kind] ||= counted_ranks.count { |r| r.last == 3 } == 1
  end

  def two_pair?
    counted_ranks = @ranks.uniq.map { |i| [i, @ranks.count(i)] }
    @cache[:two_pair] ||= counted_ranks.count { |r| r.last == 2 } == 2
  end

  def high_card_value
    @cache[:high_card_value] ||= calc_high_card_value
  end

  def calc_high_card_value
    return 0.9 if includes_rank?('A')
    return 0.85 if includes_rank?('K')
    return 0.8 if includes_rank?('Q')
    return 0.75 if includes_rank?('J')
    return 0.7 if includes_rank?('10')
    return 0.65 if includes_rank?('9')
    return 0.6 if includes_rank?('8')
    return 0.55 if includes_rank?('7')
    return 0.5 if includes_rank?('6')
    return 0.45 if includes_rank?('5')
    return 0.4 if includes_rank?('4')
    return 0.35 if includes_rank?('3')
    return 0.3 if includes_rank?('2')
  end

  def flush?
    @cache[:flush] ||= @suites.uniq.size == 1
  end

  def pair?
    @cache[:pair] ||= @ranks.uniq.size == (@hand.size - 1)
  end
end
