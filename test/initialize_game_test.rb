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
end