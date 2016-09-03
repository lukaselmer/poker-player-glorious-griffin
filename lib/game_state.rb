require_relative 'other_player'

class GameState
  def initialize(game_state_json)
    @game_state_json = game_state_json
    @players = @game_state_json['players'].map { |player| OtherPlayer.new(player) }
  end

  def current_buy_in
    @game_state_json['current_buy_in']
  end

  def max_players_bet
    @players.max_by(&:bet)
  end

  def call_value
    current_buy_in - max_players_bet
  end

  def raise_value(raise_by)
    call_value + raise_by
  end
end
