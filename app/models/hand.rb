class Hand
  include Comparable

  attr_reader :cards, :groups, :hand_strength, :sorted_values
  RANKS = %i(high-card one-pair two-pair three-of-a-kind straight flush
                   full-house four-of-a-kind straight-flush)

  LOW_STRAIGHT_RANKS = ['2', '3', '4', '5', 'A']

  def initialize(hand_1)
    @cards = build_hand(hand_1)
    @groups = group
    @hand_strength = RANKS.index(evaluate)
    @sorted_values = sort_card_values
  end

  def <=> other
    if (@hand_strength <=> other.hand_strength) == 0
      return  sorted_values <=> other.sorted_values
    end
    @hand_strength <=> other.hand_strength
  end

  def build_hand(hand)
    hand.split(' ').map do |card|
      Card.new(card)
    end
  end

  def sort_card_values
    # sort the values and reverse them so the highest numbers are first for comparison
    @cards.map(&:value).sort.reverse
  end

  def suits
    @cards.map(&:suit)
  end

  def a_flush?
    suits.uniq.length === 1
  end

  def a_straight?
    sort.each_cons(2).all? {|c1, c2| c2.value - c1.value == 1}
  end

  def sort
    # if the hand has an ace and consecutive low cards, change the value of the Ace to -1
    if @cards.sort.map(&:rank) == LOW_STRAIGHT_RANKS
      @cards.find {|card| card.rank == 'A'}.value = -1
    end
    @cards.sort
  end

  def group
    # create groupings of the cards by their rank
    groupings = Hash.new(0)
    @cards.each {|c| groupings[c.rank] += 1}
    groupings
  end

  def evaluate
    if a_straight?
      a_flush? ? :'straight-flush' : :'straight'
    elsif a_flush?
      :'flush'
    else
      case @groups.values.sort
      when [1, 1, 1, 1, 1] then
        :'high-card'
      when [1, 1, 1, 2] then
        :'one-pair'
      when [1, 2, 2] then
        :'two-pair'
      when [1, 1, 3] then
        :'three-of-a-kind'
      when [2, 3] then
        :'full-house'
      when [1, 4] then
        :'four-of-a-kind'
      end
    end
  end
end
