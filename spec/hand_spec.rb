require_relative '../lib/hand'

# suit: clubs,spades,hearts,diamonds
# rank: 2-10 and J,Q,K,A

RSpec.describe Hand do
  describe '#rank_against' do
    it 'returns a probability' do
      my_hand = Hand.new(nil)
      other_hand = Hand.new(nil)

      expect(my_hand.win_probability(other_hand)).to be_between(0, 1)
    end

    it 'ranks flush against pairs' do
      my_hand = Hand.new([
                           { 'suit': '' }
                         ])
      other_hand = Hand.new(nil)

      expect(my_hand.win_probability(other_hand)).to be_between(0, 1)
    end
  end
end
