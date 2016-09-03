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
    @players.max_by(&:bet).bet
  end

  def call_value
    current_buy_in - max_players_bet
  end

  def game_id
    @game_state_json['game_id']
  end

  def extract_player(name)
    @game_state_json['players'].select { |player| player if player['name'] == name }.first
  end

  def cards(player_name)
    extract_player(player_name)['hole_cards']
  end

  def minimum_raise
    @game_state_json['minimum_raise']
  end
end
