require "test_helper"

class HandTest < ActiveSupport::TestCase
  test "#determine_winner" do
    hand = Hand.create(player_1:"8C TS KC 9H 4S", player_2: "7D 2S 5D 3S AC")
    hand.determine_winner
    assert hand.winner, 'player_2'
  end
end

