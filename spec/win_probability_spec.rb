require_relative '../lib/strategies/win_probability_calculator'
require_relative '../lib/card_repository'
require_relative 'mocks/game_state_mock'

RSpec.describe WinProbabilityCalculator do
  describe 'bet_request' do
    it 'works with different community hands' do
      possible_cards = CardRepository.all
      Array.new(3) do
        random_cards = possible_cards.shuffle[(0..[1, 2, 3, 4].sample)]
        my_hand = random_cards[0..1]
        community_cards = random_cards[2..4]

        probability = WinProbabilityCalculator.new.calculate_win_probability(my_hand, community_cards)
        expect(probability).to be_within(0.5).of(0.5)
      end
    end
  end
end
