require_relative '../lib/strategy'
require_relative 'mocks/game_state_mock'

RSpec.describe Strategy do
  describe 'bet_request' do
    it 'returns a valid value' do
      mock = GameStateMock.new
      strategy = Strategy.new(mock.for_bet_request, mock.for_showdown)

      1000.times do
        expect(strategy.fold?).to be_truthy
      end
    end
  end
end
