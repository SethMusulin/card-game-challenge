class CreateHands < ActiveRecord::Migration[6.1]
  def change
    create_table :hands do |t|
      t.string :player_1
      t.string :player_2

      t.timestamps
    end
  end
end
