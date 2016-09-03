require_relative '../card_repository'
require_relative '../hand'

class WinProbabilityCalculator
  MONTE_CARLO_ITERATIONS = 50

  def calculate_win_probability(my_hidden_cards, community_cards, number_of_active_players)
    my_hand = my_hidden_cards + community_cards

    possible_outcomes = Array.new(MONTE_CARLO_ITERATIONS) do
      calculate_single_run(my_hand, community_cards, number_of_active_players)
    end
    possible_outcomes.inject(&:+) / MONTE_CARLO_ITERATIONS.to_f
  end

  private

  def reset_cards
    @available_cards = CardRepository.all.dup
  end

  def calculate_single_run(my_hand, community_cards, players)
    return calculate_for_1_player(my_hand, community_cards, players) if players == 2
    return calculate_for_2_players(my_hand, community_cards, players) if players == 3
    calculate_for_3_players(my_hand, community_cards, players)
  end

  def calculate_for_3_players(my_hand, community_cards, _number_of_active_players)
    reset_cards
    remove_cards(my_hand)
    my_possible_hand = complete_hand(my_hand)
    possible_hand_1 = complete_hand(community_cards)
    possible_hand_2 = complete_hand(community_cards)
    possible_hand_3 = complete_hand(community_cards)

    my_possible_hand.win_probability(possible_hand_1) *
      my_possible_hand.win_probability(possible_hand_2) *
      my_possible_hand.win_probability(possible_hand_3)
  end

  def calculate_for_2_players(my_hand, community_cards, _number_of_active_players)
    reset_cards
    remove_cards(my_hand)
    my_possible_hand = complete_hand(my_hand)
    possible_hand_1 = complete_hand(community_cards)
    possible_hand_2 = complete_hand(community_cards)

    my_possible_hand.win_probability(possible_hand_1) *
      my_possible_hand.win_probability(possible_hand_2)
  end

  def calculate_for_1_player(my_hand, community_cards, _number_of_active_players)
    reset_cards
    remove_cards(my_hand)
    my_possible_hand = complete_hand(my_hand)
    possible_hand_1 = complete_hand(community_cards)
    my_possible_hand.win_probability(possible_hand_1)
  end

  def remove_cards(hand)
    hand.each { |card| remove_card(card) }
  end

  def remove_card(card)
    @available_cards.delete(card)
  end

  def same_card?(card, current_card)
    current_card.suit == card.suit && current_card.rank == card.rank
  end

  def complete_hand(hand)
    new_hand = hand.dup
    while new_hand.size != 5
      additional_card = random_card
      remove_card(additional_card)
      new_hand << additional_card
    end
    Hand.new(new_hand)
  end

  def random_card
    @available_cards.sample
  end
end
