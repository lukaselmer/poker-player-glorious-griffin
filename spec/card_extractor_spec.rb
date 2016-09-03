require_relative '../lib/player'
require_relative '../lib/card_extractor'
require_relative 'mocks/game_state_mock'

RSpec.describe CardExtractor do
  describe '#cards' do
    it 'returns a list' do
      game_state = GameStateMock.new.for_bet_request
      extractor = CardExtractor.new('Player 1', game_state)
      expect(extractor.cards).to be_an(Array)
    end

    it 'returns a specific card' do
      game_state = GameStateMock.new.for_bet_request
      extractor = CardExtractor.new('Player 2', game_state)

      card = extractor.cards.first
      expect(card['rank']).to eq('6')
      expect(card['suit']).to eq('hearts')
    end
  end
end
