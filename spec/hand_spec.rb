require_relative '../lib/hand'

# suit: clubs,spades,hearts,diamonds
# rank: 2-10 and J,Q,K,A

RSpec.describe Hand do
  let(:flush) do
    [
      { 'suit': 'hearts', 'rank': '8' },
      { 'suit': 'hearts', 'rank': '9' },
      { 'suit': 'hearts', 'rank': '5' },
      { 'suit': 'hearts', 'rank': 'J' },
      { 'suit': 'hearts', 'rank': '2' }
    ]
  end

  let(:straight) do
    [
      { 'suit': 'hearts', 'rank': '2' },
      { 'suit': 'clubs', 'rank': '3' },
      { 'suit': 'clubs', 'rank': '4' },
      { 'suit': 'hearts', 'rank': '5' },
      { 'suit': 'spades', 'rank': '6' }
    ]
  end

  describe '#rank_against' do
    it 'returns a probability' do
      my_hand = Hand.new(flush)
      other_hand = Hand.new(straight)
      expect(my_hand.win_probability(other_hand)).to be_between(0, 1)
    end

    it 'lets straight win over flush' do
      my_hand = Hand.new(flush)
      other_hand = Hand.new(straight)
      expect(my_hand.win_probability(other_hand)).to eq(1)
    end

    describe '#flush?' do
      it 'recognizes' do
        expect(Hand.new(flush)).to be_flush
      end

      it 'recognizes NOT' do
        expect(Hand.new(straight)).to be_flush
      end
    end
  end
end
