require "test_helper"
require "minitest/autorun"

describe Card do
  it "Card has rank, suit an value on init" do
    assert_equal Card.new('2H').rank, "2"
    assert_equal Card.new('2H').suit, "H"
    assert_equal Card.new('2H').value, 0

    assert_equal Card.new('TH').rank, "T"
    assert_equal Card.new('TH').suit, "H"
    assert_equal Card.new('TH').value, 8

    assert_equal Card.new('JC').rank, "J"
    assert_equal Card.new('JC').suit, "C"
    assert_equal Card.new('JC').value, 9

    assert_equal Card.new('QD').rank, "Q"
    assert_equal Card.new('QD').suit, "D"
    assert_equal Card.new('QD').value, 10

    assert_equal Card.new('KS').rank, "K"
    assert_equal Card.new('KS').suit, "S"
    assert_equal Card.new('KS').value, 11

    assert_equal Card.new('AS').rank, "A"
    assert_equal Card.new('AS').suit, "S"
    assert_equal Card.new('AS').value, 12
  end

  it "Equal to" do
    assert_equal Card.new("TH") == Card.new("TH"), true
    assert_equal Card.new("2C") == Card.new("2C"), true
    assert_equal Card.new("8D") == Card.new("8D"), true
    assert_equal Card.new("2S") == Card.new("QD"), false
  end
  it "<=>" do
    assert_equal Card.new("TH") <=> Card.new("TH"), 0
    assert_equal Card.new("TH") <=> Card.new("JH"), -1
    assert_equal Card.new("JH") <=> Card.new("TH"), 1
  end
end
