class GameStateExtractor
  def initialize(player_name, game_state)
    @player_name = player_name
    @game_state = game_state
  end

  def cards
    extracted_player['hole_cards']
  end

  private

  def extracted_player
    @game_state['players'].select { |player| player if player['name'] == @player_name }.first
  end
end
