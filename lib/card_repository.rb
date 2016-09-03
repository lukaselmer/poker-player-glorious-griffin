class CardRepository
  def all
    suits = %w(clubs spades hearts diamonds)
    ranks = %w(2 3 4 5 6 7 8 9 10 J Q K A)

    suits.product(ranks).map do |suit_rank|
      {
        'suit': suit_rank.first,
        'rank': suit_rank.last
      }
    end
  end
end
