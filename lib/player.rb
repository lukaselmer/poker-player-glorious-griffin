require_relative 'strategy'
require_relative 'strategies/random_strategy'
require_relative 'strategies/win_probability_strategy'
require_relative 'strategies/win_probability_calculator'
require_relative 'card_repository'
require_relative 'game_state'
require_relative 'game'
require_relative 'hand'
require_relative 'other_player'

class Player
  GIT_RELEASE = `git log --pretty=format:\"%h\" -1`.freeze
  VERSION = "Glorious Griffin #{Time.now} #{GIT_RELEASE} #{ENV['SOURCE_VERSION']}".freeze

  def initialize
    @games = {}
  end

  def bet_request(game_state_raw)
    init_current_game(game_state_raw)

    return 0 if strategy.fold?
    return call_value if strategy.call?
    raise_value
  end

  def showdown(game_state_raw)
    bet_request(game_state_raw)
  end

  private

  def init_current_game(game_state_raw)
    game_state = GameState.new(game_state_raw)
    @games[game_state.game_id] ||= Game.new
    @current_game = @games[game_state.game_id]
    @current_game.game_state = game_state
  end

  def game_state
    @current_game.game_state
  end

  def strategy
    @current_game.strategy
  end

  def call_value
    game_state.call_value
  end

  def raise_value
    game_state.call_value + strategy.value_to_raise
  end
end
