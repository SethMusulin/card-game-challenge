class ChangeHandsToDeals < ActiveRecord::Migration[6.1]
  def change
    rename_table :hands, :deals
  end
end
