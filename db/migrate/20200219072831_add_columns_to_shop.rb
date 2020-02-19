class AddColumnsToShop < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :ave_congestion, :float
    add_column :shops, :ave_menu, :float
    add_column :shops, :ave_price, :float
    add_column :shops, :ave_wifi, :float
    add_column :shops, :ave_others, :float
  end
end
