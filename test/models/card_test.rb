require "test_helper"

class CardTest < ActiveSupport::TestCase
  test "Card has rank and suit on init" do
    assert_equal Card.new('2H').rank, "2"
    assert_equal Card.new('2H').suit, "H"
    assert_equal Card.new('2H').readable, "2 of Hearts"

    assert_equal Card.new('TH').rank, "T"
    assert_equal Card.new('TH').suit, "H"
    assert_equal Card.new('TH').readable, "10 of Hearts"

    assert_equal Card.new('JC').rank, "J"
    assert_equal Card.new('JC').suit, "C"
    assert_equal Card.new('JC').readable, "Jack of Clubs"

    assert_equal Card.new('QD').rank, "Q"
    assert_equal Card.new('QD').suit, "D"
    assert_equal Card.new('QD').readable, "Queen of Diamonds"

    assert_equal Card.new('KS').rank, "K"
    assert_equal Card.new('KS').suit, "S"
    assert_equal Card.new('KS').readable, "King of Spades"

    assert_equal Card.new('AS').rank, "A"
    assert_equal Card.new('AS').suit, "S"
    assert_equal Card.new('AS').readable, "Ace of Spades"
  end

  test "Equal to" do
    assert Card.new("TH") == Card.new("TH"), true
    assert Card.new("2C") == Card.new("2C"), true
    assert Card.new("8D") == Card.new("8D"), true
    assert_not Card.new("2S") == Card.new("QD"), false
  end
end
