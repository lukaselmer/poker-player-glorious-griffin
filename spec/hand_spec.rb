require_relative '../lib/hand'

RSpec.describe Hand do
  describe '#rank_against' do
    it 'returns a probability' do
      my_hand = Hand.new(nil)
      other_hand = Hand.new(nil)

      expect(my_hand.rank_against(other_hand)).to be_between(0, 1)
    end
  end
end
