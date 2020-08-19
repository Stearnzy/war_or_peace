class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = [card1, card2, card3]
    @high_ranking_cards = []
  end

  def rank_of_card_at(index)
    return cards[index].rank
  end

  def high_ranking_cards
    cards.each do |card|
      @high_ranking_cards << card if card.rank >= 11
    end
  end


end

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)

deck = Deck.new(cards)