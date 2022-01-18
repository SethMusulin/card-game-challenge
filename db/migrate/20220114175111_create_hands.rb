class CreateHands < ActiveRecord::Migration[6.1]
  def change
    create_table :hands do |t|
      t.text :player_1
      t.text :player_2

      t.timestamps
    end
  end
end
