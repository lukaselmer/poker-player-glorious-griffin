require_relative '../lib/player'
require_relative '../lib/game_state'
require_relative 'mocks/game_state_mock'

RSpec.describe GameState do
  describe '#cards' do
    it 'returns a list' do
      game_state = GameStateMock.new.for_bet_request
      extractor = GameState.new(game_state)
      expect(extractor.cards('Player 1')).to be_an(Array)
    end

    it 'returns a specific card' do
      game_state = GameStateMock.new.for_bet_request
      extractor = GameState.new(game_state)

      card = extractor.cards('Glorious Griffin').first
      expect(card['rank']).to eq('6')
      expect(card['suit']).to eq('hearts')
    end
  end
end
