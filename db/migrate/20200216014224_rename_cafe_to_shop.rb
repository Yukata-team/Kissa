class RenameCafeToShop < ActiveRecord::Migration[5.2]
  def change
    rename_table :caves, :shops
  end
end
