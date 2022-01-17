class Hand < ApplicationRecord
  def determine_winner
    if self.winner.blank?
      self.winner = HandEvaluator.evaluate(player_1, self.player_2)
      save
    else
      self.winner
    end
  end
end

