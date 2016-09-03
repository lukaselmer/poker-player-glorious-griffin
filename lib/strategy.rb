class Strategy
  def initialize(bet_request, showdown)
    @bet_request = bet_request
    @showdown = showdown
  end

  def fold?
    true
  end
end
