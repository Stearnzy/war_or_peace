require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/initialize_game'

class InitializeGameTest < Minitest::Test
  def test_it_exists
    start = InitializeGame.new
    assert_instance_of InitializeGame, start
  end

  def test_ending_game_message
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)

    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    require "pry"; binding.pry
  end
end