class OtherPlayer
  def initialize(player_json)
    @player_json = player_json
  end

  def bet
    @player_json['bet']
  end
end
