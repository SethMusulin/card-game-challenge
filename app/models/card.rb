class Card
  attr_reader  :rank, :suit

  ACE = "Ace".freeze
  KING = "King".freeze
  QUEEN = "Queen".freeze
  JACK = "Jack".freeze

  CLUBS = "Clubs".freeze
  DIAMONDS = "Diamonds".freeze
  HEARTS = "Hearts".freeze
  SPADES = "Spades".freeze

  RANKS = {
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "T" => 10,
      "J" => JACK,
      "Q" => QUEEN,
      "K" => KING,
      "A" => ACE
  }

  SUITS = {
      "C" => CLUBS,
      "D" => DIAMONDS,
      "H" => HEARTS,
      "S" => SPADES
  }
  def initialize(card)
    @rank, @suit = card[0],card[1]
  end

  def ==(other)
    rank == other.rank && suit == other.suit
  end

  def readable
    "#{RANKS[@rank]} of #{SUITS[@suit]}"
  end
end