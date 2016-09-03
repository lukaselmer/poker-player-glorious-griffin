require_relative 'strategy'
require_relative 'game_state'

class Player
  GIT_RELEASE = `git log --pretty=format:\"%h\" -1`.freeze
  VERSION = "Two Griffins #{Time.now} #{GIT_RELEASE} #{ENV['SOURCE_VERSION']}".freeze

  def bet_request(game_state_raw)
    @game_state = GameState.new(game_state_raw)
    strategy = Strategy.new(@game_state)

    return 0 if strategy.fold?
    return call_value if strategy.check?
    raise_amount
  end

  def showdown(game_state_raw)
    bet_request(game_state_raw)
  end

  private

  def call_value
    @game_state.call_value
  end

  def raise_amount
    @game_state.raise_value(1)
  end
end
