class Card
  include Comparable

  attr_accessor :value
  attr_reader  :rank, :suit

  RANKS = %i(2 3 4 5 6 7 8 9 T J Q K A)
  SUITS = %i("H" "D" "C" "S")

  def initialize(card)
    @rank, @suit = card[0],card[1]
    @value = RANKS.index(@rank.to_sym)
  end

  def ==(other)
    rank == other.rank && suit == other.suit
  end
  def <=> (other)
    @value <=> other.value
  end
end