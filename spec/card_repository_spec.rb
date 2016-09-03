require_relative '../lib/card_repository'

RSpec.describe CardRepository do
  describe '#all' do
    it 'returns an enumerable' do
      repository = CardRepository.new
      expect(repository.all).to be_an(Enumerable)
    end

    it 'returns a 52 cards' do
      repository = CardRepository.new
      expect(repository.all.size).to eq(52)
    end

    it 'produces king hearts' do
      repository = CardRepository.new
      hearts_king = { 'suit' => 'hearts', 'rank' => 'K' }
      expect(repository.all).to include(hearts_king)
    end

    it 'produces 5 clubs' do
      repository = CardRepository.new
      clubs_5 = { 'suit' => 'clubs', 'rank' => '5' }
      expect(repository.all).to include(clubs_5)
    end
  end
end
