require_relative 'strategy'
require_relative 'game_state'

class Player
  GIT_RELEASE = `git log --pretty=format:\"%h\" -1`.freeze
  VERSION = "Two Griffins #{Time.now} #{GIT_RELEASE} #{ENV['SOURCE_VERSION']}".freeze

  def bet_request(game_state_raw)
    strategy = Strategy.new(GameState.new(game_state_raw))

    return 0 if strategy.fold?
    return check_amount if strategy.check?
    raise_amount
  end

  def showdown(game_state_raw)
    bet_request(game_state_raw)
  end

  private

  def check_amount
    1
  end

  def raise_amount
    1
  end
end
