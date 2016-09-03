require_relative '../lib/card_repository'

RSpec.describe CardRepository do
  describe '#all' do
    it 'returns an enumerable' do
      expect(CardRepository::ALL).to be_an(Enumerable)
    end

    it 'returns a 52 cards' do
      expect(CardRepository::ALL.size).to eq(52)
    end

    it 'produces king hearts' do
      hearts_king = { 'suit' => 'hearts', 'rank' => 'K' }
      expect(CardRepository::ALL).to include(hearts_king)
    end

    it 'produces 5 clubs' do
      clubs_5 = { 'suit' => 'clubs', 'rank' => '5' }
      expect(CardRepository::ALL).to include(clubs_5)
    end
  end
end
