class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :tables do |t|
      t.string :player_1
      t.string :player_2

      t.timestamps
    end
  end
end
