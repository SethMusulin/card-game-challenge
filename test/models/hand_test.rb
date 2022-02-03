require "test_helper"
require "minitest/autorun"

describe Hand do
  describe 'initialization' do
    it "sets cards, groups, hand_strength, sorted_values on init" do
      deal = Hand.new("8C TS KC 9H 4S")
      deal.cards.each do |card|
        assert card.is_a?(Card)
      end

      assert_equal deal.groups, {6=>1, 8=>1, 11=>1, 7=>1, 2=>1}
      assert_equal deal.hand_strength, 0
      assert_equal deal.sorted_values, [[1, 11], [1, 8], [1, 7], [1, 6], [1, 2]]
    end
  end
  describe 'evaluate' do
    it "evaluates a high card" do
      deal = Hand.new("8C TS KC 9H 4S")
      assert_equal deal.evaluate, :"high-card"
    end
    it "evaluates one pair" do
      deal = Hand.new("8C 8S KC 9H 4S")
      assert_equal deal.evaluate, :"one-pair"
    end
    it "evaluates two pair" do
      deal = Hand.new("8C 8S 9C 9H 4S")
      assert_equal deal.evaluate, :"two-pair"
    end
    it "evaluates three of a kind" do
      deal = Hand.new("8C 8S 8S 9H 4S")
      assert_equal deal.evaluate, :'three-of-a-kind'
    end
    it "evaluates a full house" do
      deal = Hand.new("8C 8S 8S 9H 9S")
      assert_equal deal.evaluate, :'full-house'
    end
    it "evaluates four of a kind" do
      deal = Hand.new("8C 8S 8S 8H 9S")
      assert_equal deal.evaluate, :'four-of-a-kind'
    end
    it "evaluates a flush" do
      deal = Hand.new("8C 2C 4C TC 9C")
      assert_equal deal.evaluate, :'flush'
    end
    it "evaluates a straight" do
      deal = Hand.new("8C 6C 5S 7H 9C")
      assert_equal deal.evaluate, :'straight'
    end
    it "evaluates an ace low straight" do
      deal = Hand.new("2C 3C 4S 5H AC")
      assert_equal deal.evaluate, :'straight'
    end
    it "evaluates an ace high straight" do
      deal = Hand.new("TC JC QS KH AC")
      assert_equal deal.evaluate, :'straight'
    end
    it "evaluates a straight flush" do
      deal = Hand.new("8C 6C 5C 7C 9C")
      assert_equal deal.evaluate, :'straight-flush'
    end
  end
  describe "<=>" do
    it 'high card wins when no other winning combos' do
      hand_1 = Hand.new("7D 2S 5D 3S AC")
      hand_2 = Hand.new("8C TS KC 9H 4S")
      assert_equal hand_1 <=> hand_2, 1
      assert_equal hand_2 <=> hand_1, -1
    end
    it 'one pair beats high card' do
      hand_1 = Hand.new("2H 2C 5S TC JS")
      hand_2 = Hand.new("2D 8C 5D TS KS")
      assert_equal hand_1 <=> hand_2, 1
      assert_equal hand_2 <=> hand_1, -1
    end
    it 'two pair beats one pair' do
      hand_1 = Hand.new("2H 2C 5S 5C JS")
      hand_2 = Hand.new("3H 4C 8S TC KS")
      assert_equal hand_1 <=> hand_2, 1
      assert_equal hand_2 <=> hand_1, -1
    end
    it 'three of a kind beats two pair' do
      hand_1 = Hand.new("2H 2C 2S 5C JS")
      hand_2 = Hand.new("3H 3C 8S 8C KS")
      assert_equal hand_1 <=> hand_2, 1
      assert_equal hand_2 <=> hand_1, -1
    end
    it 'straight beats three of a kind' do
      hand_1 = Hand.new("2H 3C 4S 5C 6S")
      hand_2 = Hand.new("3H 3D 3S 8C KS")
      assert_equal hand_1 <=> hand_2, 1
      assert_equal hand_2 <=> hand_1, -1
    end
    it 'flush beats a straight' do
      hand_1 = Hand.new("8H 3H TH 8H KH")
      hand_2 = Hand.new("2H 3C 4S 5C 6S")
      assert_equal hand_1 <=> hand_2, 1
      assert_equal hand_2 <=> hand_1, -1
    end
    it "full house beats a flush" do
      hand_1 = Hand.new("8H 8D 8S KD KH")
      hand_2 = Hand.new("2H 3H TH QH 9H")
      assert_equal hand_1 <=> hand_2, 1
      assert_equal hand_2 <=> hand_1, -1
    end
    it "four of a kind beats a full house" do
      hand_1 = Hand.new("9H 9D 9S 9C 2C")
      hand_2 = Hand.new("8H 8D 8S KD KH")
      assert_equal hand_1 <=> hand_2, 1
      assert_equal hand_2 <=> hand_1, -1
    end
    it "straight flush beats four of a kind" do
      hand_1 = Hand.new("2H 3H 4H 5H 6H")
      hand_2 = Hand.new("8H 8D 8S 8C QS")
      assert_equal hand_1 <=> hand_2, 1
      assert_equal hand_2 <=> hand_1, -1
    end
    it "royal flush beats a straight flush" do
      hand_1 = Hand.new("TH JH QH KH AH")
      hand_2 = Hand.new("2H 3H 4H 5H 6H")
      assert_equal hand_1 <=> hand_2, 1
      assert_equal hand_2 <=> hand_1, -1
    end
    describe 'special cases' do
      it 'ace can be low' do
        hand_1 = Hand.new("2H 3C 4S 5C AS")
        hand_2 = Hand.new("3H 3D 3S 8C KS")
        assert_equal hand_1 <=> hand_2, 1
        assert_equal hand_2 <=> hand_1, -1
      end
      it 'next high card' do
        hand_1 = Hand.new("2H 2C 4H 4C AS")
        hand_2 = Hand.new("2D 2S 4D 4S KS")
        assert_equal hand_1 <=> hand_2, 1
        assert_equal hand_2 <=> hand_1, -1
      end
      it'high pair wins' do
        hand_1 = Hand.new("5H KS 9C 7D 9H")
        hand_2 = Hand.new("8D 3S 5D 5C AH")
        assert_equal hand_1 <=> hand_2, 1
        assert_equal hand_2 <=> hand_1, -1
      end
      it'high three of a kind wins' do
        hand_1 = Hand.new("6H KS 9C 9D 9H")
        hand_2 = Hand.new("8D 3S 5D 5C 5H")
        assert_equal hand_1 <=> hand_2, 1
        assert_equal hand_2 <=> hand_1, -1
      end
      it'high four of a kind wins' do
        hand_1 = Hand.new("6H 9S 9C 9D 9H")
        hand_2 = Hand.new("8D 5S 5D 5C 5H")
        assert_equal hand_1 <=> hand_2, 1
        assert_equal hand_2 <=> hand_1, -1
      end
      it 'higher full house wins'do
        hand_1 = Hand.new("6H 6S TC TD TH")
        hand_2 = Hand.new("8D 8S 5D 5C 5H")
        assert_equal hand_1 <=> hand_2, 1
        assert_equal hand_2 <=> hand_1, -1
      end
      it 'higher straight house wins'do
        hand_1 = Hand.new("4H 5S 6C 7D 8H")
        hand_2 = Hand.new("5D 6S 7S 8C 9H")
        assert_equal hand_1 <=> hand_2, -1
        assert_equal hand_2 <=> hand_1, 1
      end
      it 'higher flush wins'do
        hand_1 = Hand.new("4H 2H JH 7H KH")
        hand_2 = Hand.new("5D 6D AD 8D 9D")
        assert_equal hand_1 <=> hand_2, -1
        assert_equal hand_2 <=> hand_1, 1
      end
      it "lowest high card" do
        hand_1 = Hand.new("3H 4C 5H 6C 8C")
        hand_2 = Hand.new("2D 4S 5D 6S 8S")
        assert_equal hand_1 <=> hand_2, 1
        assert_equal hand_2 <=> hand_1, -1
      end
      it 'is a push' do
        hand_1 = Hand.new("3H 4C 5H 6C 8C")
        hand_2 = Hand.new("3D 4S 5D 6S 8S")
        assert_equal hand_1 <=> hand_2, 0
        assert_equal hand_2 <=> hand_1, 0
      end
    end
  end
end
