class AddWinnerToHands < ActiveRecord::Migration[6.1]
  def change
    add_column :hands, :winner, :text
  end
end
