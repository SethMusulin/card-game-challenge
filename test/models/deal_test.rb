require "test_helper"

class DealTest < ActiveSupport::TestCase
  test "player 2 wins" do
    hand = Deal.create(player_1: "8C TS KC 9H 4S", player_2: "7D 7S 5D 3S AC")
    hand.determine_winner
    assert_equal hand.winner, 'Player 2'
    end
    test "player 1 wins" do
    hand = Deal.create(player_1: "2H 4S 5C 5S TC", player_2: "KC JD 6C TS 3C")
    hand.determine_winner
    assert_equal hand.winner, 'Player 1'
  end
  test "players push" do
    hand = Deal.create(player_1: "3H 4C 5H 6C 8C", player_2: "3D 4S 5D 6S 8S")
    hand.determine_winner
    assert_equal hand.winner, 'Push'
  end
  test "scopes" do
    assert_equal Deal.player_1_win_count, 0
    assert_equal Deal.player_2_win_count, 0
    assert_equal Deal.pushes, 0
    Deal.create(player_1: "7D 2S 5D 3S AC", player_2: "8C TS KC 9H 4S").determine_winner
    assert_equal Deal.player_1_win_count, 1
    Deal.create(player_1: "8C TS KC 9H 4S", player_2: "7D 2S 5D 3S AC").determine_winner
    assert_equal Deal.player_2_win_count, 1
    Deal.create(player_1: "3H 4C 5H 6C 8C", player_2: "3D 4S 5D 6S 8S").determine_winner
    assert_equal Deal.pushes, 1
  end
end

