class Turn
  attr_reader :player1, :player2, :spoils_of_war, :turn_count, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_count = 1
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    end
  end

  def winner
    if self.type == :basic
      if player1.deck.cards[0].rank > player2.deck.cards[0].rank
        return player1
      elsif player1.deck.cards[0].rank < player2.deck.cards[0].rank
        return player2
      end
    elsif self.type == :war
      if player1.deck.cards[2].rank > player2.deck.cards[2].rank
        return player1
      elsif player1.deck.cards[2].rank < player2.deck.cards[2].rank
        return player2
      end
    elsif self.type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif self.type == :war
      3.times {@spoils_of_war << player1.deck.remove_card}
      3.times {@spoils_of_war << player2.deck.remove_card}
    elsif self.type == :mutually_assured_destruction
      3.times {player1.deck.remove_card}
      3.times {player2.deck.remove_card}
    end
  end

  def award_spoils(winner)
    if winner == player1
      @spoils_of_war.each do |card|
        player1.deck.cards << card
      end
      @turn_count += 1
    elsif winner == player2
      @spoils_of_war.each do |card|
        player2.deck.cards << card
      end
      @turn_count += 1
    end
  end

end