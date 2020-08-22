require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


class InitializeGame

  def start
    # two_hearts = Card.new(:heart, '2', 2)
    # three_hearts = Card.new(:heart, '3', 3)
    # four_hearts = Card.new(:heart, '4', 4)
    # five_hearts = Card.new(:heart, '5', 5)
    # six_hearts = Card.new(:heart, '6', 6)
    # seven_hearts = Card.new(:heart, '7', 7)
    # eight_hearts = Card.new(:heart, '8', 8)
    # nine_hearts = Card.new(:heart, '9', 9)
    # ten_hearts = Card.new(:heart, '10', 10)
    # jack_hearts = Card.new(:heart, 'Jack', 11)
    # queen_hearts = Card.new(:heart, 'Queen', 12)
    # king_hearts = Card.new(:heart, 'King', 13)
    # ace_hearts = Card.new(:heart, 'Ace', 14)
    # two_diamonds = Card.new(:diamond, '2', 2)
    # three_diamonds = Card.new(:diamond, '3', 3)
    # four_diamonds = Card.new(:diamond, '4', 4)
    # five_diamonds = Card.new(:diamond, '5', 5)
    # six_diamonds = Card.new(:diamond, '6', 6)
    # seven_diamonds = Card.new(:diamond, '7', 7)
    # eight_diamonds = Card.new(:diamond, '8', 8)
    # nine_diamonds = Card.new(:diamond, '9', 9)
    # ten_diamonds = Card.new(:diamond, '10', 10)
    # jack_diamonds = Card.new(:diamond, 'Jack', 11)
    # queen_diamonds = Card.new(:diamond, 'Queen', 12)
    # king_diamonds = Card.new(:diamond, 'King', 13)
    # ace_diamonds = Card.new(:diamond, 'Ace', 14)
    # two_spades = Card.new(:spade, '2', 2)
    # three_spades = Card.new(:spade, '3', 3)
    # four_spades = Card.new(:spade, '4', 4)
    # five_spades = Card.new(:spade, '5', 5)
    # six_spades = Card.new(:spade, '6', 6)
    # seven_spades = Card.new(:spade, '7', 7)
    # eight_spades = Card.new(:spade, '8', 8)
    # nine_spades = Card.new(:spade, '9', 9)
    # ten_spades = Card.new(:spade, '10', 10)
    # jack_spades = Card.new(:spade, 'Jack', 11)
    # queen_spades = Card.new(:spade, 'Queen', 12)
    # king_spades = Card.new(:spade, 'King', 13)
    # ace_spades = Card.new(:spade, 'Ace', 14)
    # two_clubs = Card.new(:club, '2', 2)
    # three_clubs = Card.new(:club, '3', 3)
    # four_clubs = Card.new(:club, '4', 4)
    # five_clubs = Card.new(:club, '5', 5)
    # six_clubs = Card.new(:club, '6', 6)
    # seven_clubs = Card.new(:club, '7', 7)
    # eight_clubs = Card.new(:club, '8', 8)
    # nine_clubs = Card.new(:club, '9', 9)
    # ten_clubs = Card.new(:club, '10', 10)
    # jack_clubs = Card.new(:club, 'Jack', 11)
    # queen_clubs = Card.new(:club, 'Queen', 12)
    # king_clubs = Card.new(:club, 'King', 13)
    # ace_clubs = Card.new(:club, 'Ace', 14)
    #
    # card_set_1 = []
    # card_set_2 = []
    # complete_deck = [two_clubs, two_hearts, two_spades, two_diamonds,
    # three_clubs, three_hearts, three_spades, three_diamonds,
    # four_clubs, four_hearts, four_spades, four_diamonds,
    # five_clubs, five_hearts, five_spades, five_diamonds,
    # six_clubs, six_hearts, six_spades, six_diamonds,
    # seven_clubs, seven_hearts, seven_spades, seven_diamonds,
    # eight_clubs, eight_hearts, eight_spades, eight_diamonds,
    # nine_clubs, nine_hearts, nine_spades, nine_diamonds,
    # ten_clubs, ten_hearts, ten_spades, ten_diamonds,
    # jack_clubs, jack_hearts, jack_spades, jack_diamonds,
    # queen_clubs, queen_hearts, queen_spades, queen_diamonds,
    # king_clubs, king_hearts, king_spades, king_diamonds,
    # ace_clubs, ace_hearts, ace_spades, ace_diamonds]
    #
    # complete_deck.shuffle!
    #
    # 26.times {card_set_1 << complete_deck.shift}
    # 26.times {card_set_2 << complete_deck.shift}
    #
    # deck1 = Deck.new(card_set_1)
    # deck2 = Deck.new(card_set_2)

    # player1 = Player.new("Megan", deck1)
    # player2 = Player.new("Aurora", deck2)
    #
    # turn = Turn.new(player1, player2)
    # require "pry"; binding.pry

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)



    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    print "> "

    until gets.chomp.upcase == "GO"
      p "Invalid entry, try again."
      print "> "
    end
      if turn.type == :basic
        turn.pile_cards
        p "Turn #{turn.turn_count}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards."
        turn.award_spoils(turn.winner)
      elsif turn.type == :war
        turn.pile_cards
        p "Turn #{turn.turn_count}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.count} cards."
        turn.award_spoils(turn.winner)
      elsif turn.type == :mutually_assured_destruction
        turn.pile_cards
        p "Turn #{turn.turn_count}: *mutually assured destruction* 6 cards removed from play."
      end
    end
end