class CardRepository
  def self.all
    @all ||= generate_all.map do |raw_card|
      Card.new(raw_card['rank'], raw_card['suit'])
    end
  end

  def self.all_hash
    @all_hash ||= generate_hash
  end

  def self.generate_all
    suits = %w(clubs spades hearts diamonds)
    ranks = %w(2 3 4 5 6 7 8 9 10 J Q K A)

    suits.product(ranks).map do |suit_rank|
      {
        'suit' => suit_rank.first,
        'rank' => suit_rank.last
      }
    end
  end

  def self.generate_hash
    Hash[all.map { |card| ["#{card.rank}#{card.suit}", card] }]
  end

  def self.find_card(raw_card)
    all_hash["#{raw_card['rank']}#{raw_card['suit']}"]
  end
end
