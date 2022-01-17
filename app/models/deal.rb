class Deal < ApplicationRecord
  scope :player_1_win_count, -> { where(winner: 'Player 1').count }
  scope :player_2_win_count, -> { where(winner: 'Player 2').count }
  scope :pushes, -> { where(winner: 'Push').count }
  def determine_winner
    if self.winner.blank?
      hand_1 = Hand.new(player_1)
      hand_2 = Hand.new(player_2)
      result = (hand_1 <=> hand_2)
      self.winner = get_winner_name(result)
      self.save
      self.winner
    else
      self.winner
    end
  end

  private

  def get_winner_name(result)
    if result == 1
      return 'Player 1'
    elsif result == -1
      return 'Player 2'
    elsif result == 0
      return 'Push'
    else
      return nil
    end
  end
end

