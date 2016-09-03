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

    it 'produces king hearst' do
      repository = CardRepository.new
      hearts_king = { 'suit': 'hearts', 'rank': 'K' }
      expect(repository.all).to include(hearts_king)
    end
  end
end
