class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :tables do |t|
      t.text :player_1
      t.text :player_2

      t.timestamps
    end
  end
end
