require_relative '../lib/player'
require_relative 'mocks/game_state_mock'

RSpec.describe Player do
  describe 'bet_request' do
    it 'returns a valid value' do
      player = Player.new

      2.times do
        result = player.bet_request(GameStateMock.new.for_bet_request)
        expect(result).to be_a(Numeric)
      end
    end
  end

  describe 'showdown' do
    it 'returns a valid value' do
      player = Player.new

      2.times do
        result = player.showdown(GameStateMock.new.for_showdown)
        expect(result).to be_a(Numeric)
      end
    end
  end
end
