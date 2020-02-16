class ChangeTotalPointToShop < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :total_point, :float
  end
end
