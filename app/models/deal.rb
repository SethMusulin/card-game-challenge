class Deal < ApplicationRecord
  # attributes:
  # player_1
  # player_2
  # winner
  def determine_winner
    if self.winner.blank?
      self.update(winner: get_winner_name(Hand.new(player_1), Hand.new(player_2)))
    end

    self.winner
  end

  private

  def get_winner_name(hand_1, hand_2)
    case hand_1 <=> hand_2
    when 1 then 'Player 1'
    when -1 then 'Player 2'
    when 0 then 'Push'
    else nil
    end
  end
end

