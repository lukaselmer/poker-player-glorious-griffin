require_relative 'other_player'

class GameState
  def initialize(game_state_json)
    @game_state_json = game_state_json
    @players = @game_state_json['players'].map { |player| OtherPlayer.new(player) }
    @community_cards = @game_state_json['community_cards']
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

  def my_cards
    cards('Glorious Griffin')
  end

  def community_cards
    wrap_cards(@community_cards)
  end

  def cards(player_name)
    wrap_cards(extract_player(player_name)['hole_cards'])
  end

  def wrap_cards(raw_cards)
    raw_cards.map { |raw_card| CardRepository.find_card(raw_card) }
  end

  def number_of_active_players
    @game_state_json['players'].select { |player| player if player['status'] == 'active' }.first
  end

  def minimum_raise
    @game_state_json['minimum_raise']
  end
end
